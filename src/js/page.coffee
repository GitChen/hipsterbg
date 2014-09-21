class viewModel

  bind: () =>
    @selectedColor = ko.observable()
    @selectedLocation = ko.observable()
    @showNoise = ko.observable(true)
    @hipsterClass = ko.observable()

  getClass: (noise) =>
    return 'hipsterbg' + ' ' +  @selectedColor() + ' ' + @selectedLocation() + ' ' + 'noise'  if @showNoise()
    return 'hipsterbg' + ' ' +  @selectedColor() + ' ' + @selectedLocation()
  subscribe: () =>
    @selectedColor.subscribe (color) =>
      @hipsterClass(@getClass())

    @selectedLocation.subscribe (loc) =>
      @hipsterClass(@getClass())

    @showNoise.subscribe (noise) =>
      @hipsterClass(@getClass())

  init: () =>
    @bind()
    @subscribe()




vm = new viewModel()
vm.init()
console.log("hibye", vm)
ko.applyBindings(vm)