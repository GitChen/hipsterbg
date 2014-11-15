(function() {
  var viewModel, vm,
    __bind = function(fn, me){ return function(){ return fn.apply(me, arguments); }; };

  viewModel = (function() {
    function viewModel() {
      this.init = __bind(this.init, this);
      this.subscribe = __bind(this.subscribe, this);
      this.getClass = __bind(this.getClass, this);
      this.bind = __bind(this.bind, this);
    }

    viewModel.prototype.bind = function() {
      this.selectedColor = ko.observable();
      this.selectedLocation = ko.observable();
      this.showNoise = ko.observable(true);
      return this.hipsterClass = ko.observable();
    };

    viewModel.prototype.getClass = function(noise) {
      if (this.showNoise()) {
        return 'hipsterbg' + ' ' + this.selectedColor() + ' ' + this.selectedLocation() + ' ' + 'noise';
      }
      return 'hipsterbg' + ' ' + this.selectedColor() + ' ' + this.selectedLocation();
    };

    viewModel.prototype.subscribe = function() {
      this.selectedColor.subscribe((function(_this) {
        return function(color) {
          return _this.hipsterClass(_this.getClass());
        };
      })(this));
      this.selectedLocation.subscribe((function(_this) {
        return function(loc) {
          return _this.hipsterClass(_this.getClass());
        };
      })(this));
      return this.showNoise.subscribe((function(_this) {
        return function(noise) {
          return _this.hipsterClass(_this.getClass());
        };
      })(this));
    };

    viewModel.prototype.init = function() {
      this.bind();
      return this.subscribe();
    };

    return viewModel;

  })();

  vm = new viewModel();

  vm.init();

  console.log("hibye", vm);

  ko.applyBindings(vm);

}).call(this);
