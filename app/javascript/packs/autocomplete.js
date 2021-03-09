function autocomplete(inp, arr) {
    /*the autocomplete function takes two arguments,
    the text field element and an array of possible autocompleted values:*/
    var currentFocus;
    var books = [];
    /*execute a function when someone writes in the text field:*/
    inp.addEventListener("input", function(e) {
      if(this.value !== ""){
        $.ajax({
          async: false,
          url:'/books',
          type:'GET',
          dataType:'json',
          data: {
            authenticity_token: $('[name="csrf-token"]')[0].content,
            "data": $("#searchBook").val()
          },
          success:function(data){
            arr = data;
          },
          error:function(data){
            console.log("error");
          }
        });
      }
      var a, b, i, val = this.value;
      /*close any already open lists of autocompleted values*/
      closeAllLists();
      if (!val) { return false;}
      currentFocus = -1;
      /*create a DIV element that will contain the items (values):*/
      a = document.createElement("DIV");
      a.setAttribute("id", this.id + "autocomplete-list");
      a.setAttribute("class", "autocomplete-items");
      /*append the DIV element as a child of the autocomplete container:*/
      this.parentNode.appendChild(a);
      /*for each item in the array...*/
      console.log("array", arr);
      for (i = 0; i < arr.length; i++) {
        /*check if the item starts with the same letters as the text field value:*/
        var regex = new RegExp(" "+$("#searchBook").val()+"|"+$("#searchBook").val(), "i");
        if (arr[i].name.match(regex)) {
          /*create a DIV element for each matching element:*/
          b = document.createElement("A");
          b.style.cssText = "display: block; background: #fff";
          //Link to a review
          b.href = "#";
          b.classList.add("border-bottom");
          b.classList.add("list-group-item-action");
          b.classList.add("list-group-item");
          b.style =":hover{background: #333;}";
          /*make the matching letters bold:*/
          var wordMatch = arr[i].name.replace(regex, "<strong>" + arr[i].name.match(regex)  +"</strong>")

          b.innerHTML = wordMatch;
          /*insert a input field that will hold the current array item's value:*/
          b.innerHTML += "<input type='hidden' value='" + arr[i].name + "'>";
          /*execute a function when someone clicks on the item value (DIV element):*/
          b.addEventListener("click", function(e) {
            /*insert the value for the autocomplete text field:*/
            inp.value = this.getElementsByTagName("input")[0].value;
                /*close the list of autocompleted values,
                (or any other open lists of autocompleted values:*/
                closeAllLists();
              });
          a.appendChild(b);
        }
      }
    });
    function closeAllLists(elmnt) {
      /*close all autocomplete lists in the document,
      except the one passed as an argument:*/
      var x = document.getElementsByClassName("autocomplete-items");
      for (var i = 0; i < x.length; i++) {
        if (elmnt != x[i] && elmnt != inp) {
          x[i].parentNode.removeChild(x[i]);
        }
      }
    }
    /*execute a function when someone clicks in the document:*/
    document.addEventListener("click", function (e) {
      closeAllLists(e.target);
    });
  }

  var suggests = [];

  autocomplete(document.getElementById("searchBook"), suggests);
