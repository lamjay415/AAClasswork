Function.prototype.myDebounce = function(interval) {
    let invoked = false;

    return () => {

        if(invoked === false){
            this.call();
            invoked = true;
            setTimeout( () => {invoked = false}, interval);
        }

    }
}