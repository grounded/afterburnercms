['', 'presenters', 'conductors'].each do |pattern|
  $LOAD_PATH.push File.expand_path(
    File.join('..', 'app', pattern), File.dirname(__FILE__)
  )
end
