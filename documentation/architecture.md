# Architecture

Afterburner CMS isn't built like your typical Rails app. At the risk of sounding scary, the problems it attempts to surmount are quite complicated, and so it requires a bit more underpinning than your standard Rails application.

Afterburner adopts what's called a [Hexagonal Architecture](http://alistair.cockburn.us/Hexagonal+architecture), and is influenced both by the [Obvious Architecture](http://obvious.retromocha.com), and also by Bob Martin's [Clean Architecture](http://blog.8thlight.com/uncle-bob/2012/08/13/the-clean-architecture.html). In short:

- All of Afterburner's application/business logic resides inside `/core`;
- Afterburner's user-side interfaces and APIs are stored in `/delivery`;
- Afterburner's data-side interfaces and APIs are inside `/adapters`.

Perhaps the most important thing to note about Afterburner's architecture is that it's designed to keep the concerns of the application separate. This means that it takes some pains to make sure that the business part of the application doesn't depend on a specific database, and doesn't explicitly tie itself to any set of presentation. It also means that inner layers of the application don't know or make any judgments about the outer layer. (If you're confused as to what this means, we highly recommend you read the above link to Bob Martin's Clean Architecture.)

The benefits of this are manifest: it means that swapping between datastores should take only a few minutes' work, and it means that you should be able to extract data from Afterburner in any way you can think of without having to work too hard. It also means that the tests are simpler to write, and--once you learn the new architecture--writing complicated extensions is actually much easier, even though simple ones might take a bit more time than your standard Rails app. (Afterburner aims to provide tools to deal with that, too.)

At least that's the theory.

## A Reminder

The architecture of Afterburner is quite a bit different from Rails. It may seem like you're not making progress, or like it takes twice as many files to write an extension for Afterburner as it does for a Rails app.

Keep two things in mind:

1. When you're learning something new, it's natural that things will take a bit longer;
2. Afterburner shifts code out of controllers and models and into Domain Controllers and Use Cases repsectively. You might wind up creating more files, but these files will be simpler and will make it easier to add, change, test, and refactor your code in the future. So, yes, you do have to create and manage a few extra files, but the trade-off is worth it. Trust us.

## Sections

### Business Logic

Business logic is the part of the application that deals with use cases of the system, which in turn detail the interplay of entities (which are our real-life things, like `Posts` or `Blogs` or `Comments`, not intangibles like `AddCommentService`).

#### Entities

In Rails, our models are our chief entities. In Afterburner, our entities share some similarities to models, but they don't save like `ActiveModels` do in Rails. Instead, they're utterly unconcerned with it; they just accept data and manipulate it. These entities reside in `/core/entities`. They're also further subdivided by their function, so all the entities pertaining to menus are in `/core/entities/menu`, for example.

#### Commands

Inside our business logic, we also have what are called `commands`. These are use case objects. In short, though, they are Plain Old Ruby Objects (*PORO*s) that take as arguments the different objects that they plan to act upon, and provide a `call` method to trigger its run. They provide a logical way to group the functionality or use cases of Afterburner (and of your application, too) *as it relates to the business logic of the app*. Note that this is not the layer that interfaces with either user- or data-facing APIs; it just implements the sometimes-complex rules that govern the relationships between the entities. These are stored inside `/core/commands`.

### Delivery

Our methods of delivery are separate from our business logic. There's quite a few default methods of delivery, but, of course, you can write your own. The folders in `/delivery` each implement a different user-facing API. In some cases, these are quite simple and conform to what we *think* of as APIs -- for example, there's an `api` folder that implements a JSON API -- but there's also a `frontend` and a a `backend` folder that implement the front-end and the back-end HTML APIs that you can consume through your web browser.

There's a lot of power in this. You can write your own delivery mechanisms, too. For example, you might want to make Afterburner handle input from a serial port (perhaps you have a card reader that is used to update a library list). You would write some classes that would massage the input into an appropriate format, and then dispatch to Domain Controllers, which would interface with the actual business application and potentially with other APIs (updating a record in the database, for example).

You can write your delivery mechanisms any way you want, of course, but Afterburner's default delivery mechanisms follow a few conventions:

- Views are stored in `app/views`;
- Controllers are located in `app/controllers`;
- Presenters (sometimes called ViewModels) are located in `app/presenters`;
- Conductors (sometimes called Domain Controllers) are located in `app/conductors`;

#### Views

What the views look like is highly dependent on the delivery mechanism. Most of the time, these will be standard Rails views, except they'll be frequently be passed Presenters, not only raw objects. In other situations, these views might look very different, or they might even be non-existent.

#### Controllers

Controllers can also vary depending on the mechanism, though they're usually either a PORO or a ActionController object. On the face of things, controllers behave like simplified Rails controllers. Their job is to receive a request and decide depending on parameters which Conductor should be instantiated to handle the application flow. The controller also handles assigning the Conductor's response to apprropriate values to pass to the template, as well as which view or layout should be rendered, in the case of Rails applications.

Note that the controller is NOT responsible for retrieving models, nor is it responsible for ensuring that they save correctly. The former is the responsibility of the Conductor, and the latter is the responsibility of something called a Repository. More on that later, though!

#### Presenters

Presenters are objects that take data structures as arguments and then expose methods to present that data in appropriate formats. For example, we have an `Html::MenuPresenter` that takes a `Menu` entity and its associations and exposes a `to_html` method that allows you to turn that data structure into an HTML tree. It also exposes methods to specify classes, IDs, and even to change the wrapper elements, as well as methods to limit the depth that the tree is output.

#### Conductors

What we call Conductors are sometimes called Services, sometimes called Domain Controllers, sometimes called Facade Controllers. We chose to call them 'Conductors' because 'Service' is usually applied to a hybrid between Conductors and Commands, and in order to avoid confusion between types of controllers. Nevertheless, they function as Domain Controllers, which is to say that they call Use Cases, wrap that response in appropriate Presenters, and then return those to the Controller. In some cases, they will withdraw data from a Repository (which handles persistence/database interaction) and pass this into a use case.

If you'd like to do a bit more reading as to why these are valuable, Nicholas J. Henry gives a good outline in [Your Rails Application is Missing a Domain Controller](http://blog.firsthand.ca/2011/12/your-rails-application-is-missing.html) -- just note that we make a distinction between Facade Controllers and Use Case Controllers, the latter of which is a Command in our architecture.


