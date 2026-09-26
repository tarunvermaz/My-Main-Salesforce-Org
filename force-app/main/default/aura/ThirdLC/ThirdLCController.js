({
    handleclick : function(component, event, helper) {
        component.set("v.Message1","First Button Clicked");
        var msg = event.getSource().get("v.label");
        component.set("v.Message", msg);
    },

    handleclick2 : function(component, event, helper){
        component.set("v.Message2", "Second Button Clicked");
        var msg = event.getSource().get("v.label");
        component.set("v.Message2", msg);
    }
})