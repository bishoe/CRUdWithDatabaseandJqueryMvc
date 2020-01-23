/// <reference path="jquery-1.9.1.intellisense.js" />
//Load Data in Table when documents is ready
$(document).ready(function () {
    loadData();
});

//Load Data function
function loadData() {
    $.ajax({
        url: "/Home/List",
        type: "GET",
        contentType: "application/json;charset=utf-8",
        dataType: "json",
        success: function (result) {
            var html = '';
            $.each(result, function (key, item) {
                html += '<tr>';
                html += '<td>' + item.ID + '</td>';
                html += '<td>' + item.Cat_id + '</td>';
                html += '<td>' + item.Item_name + '</td>';
                html += '<td>' + item.Item_img + '</td>';
                html += '<td>' + item.Item_price + '</td>';
                html += '<td>' + item.Item_quantity + '</td>';
                html += '<td>' + item.Item_Detalis + '</td>';
                html += '<td><a href="#" onclick="return getbyID(' + item.ID + ')">Edit</a> | <a href="#" onclick="Delele(' + item.ID + ')">Delete</a></td>';
                html += '</tr>';
            });
            $('.tbody').html(html);
        },
        error: function (errormessage) {
            alert(errormessage.responseText);
        }
    });
}

//Add Data Function 
function Add() {
    var res = validate();
    if (res == false) {
        return false;
    }
    var AddNeObj = {
        ID: $('#ID').val(),
        Cat_id: $('#Cat_id').val(),
        Item_name: $('#Item_name').val(),
        Item_img: $('#Item_img').val(),
        Item_price: $('#Item_price').val(),
        Item_quantity: $('#Item_quantity').val(),
        Item_Detalis: $('#Item_Detalis').val()
    };
    $.ajax({
        url: "/Home/Add",
        data: JSON.stringify(AddNeObj),
        type: "POST",
        contentType: "application/json;charset=utf-8",
        dataType: "json",
        success: function (result) {
            loadData();
            $('#myModal').modal('hide');
        },
        error: function (errormessage) {
            alert(errormessage.responseText);
        }
    });
}

//Function for getting the Data Based upon Employee ID
function getbyID(AddNeID) {
    $('#Cat_id').css('border-color', 'lightgrey');
    $('#Item_name').css('border-color', 'lightgrey');
    $('#Item_img').css('border-color', 'lightgrey');
    $('#Item_price').css('border-color', 'lightgrey');
    $('#Item_quantity').css('border-color', 'lightgrey');
    $('#Item_Detalis').css('border-color', 'lightgrey');


    $.ajax({
        url: "/Home/getbyID/" + AddNeID,
        typr: "GET",
        contentType: "application/json;charset=UTF-8",
        dataType: "json",
        success: function (result) {
            $('#ID').val(result.ID);
            $('#Cat_id').val(result.Cat_id);
            $('#Item_name').val(result.Item_name);
            $('#Item_img').val(result.Item_img);
            $('#Item_price').val(result.Item_price);
            $('#Item_quantity').val(result.Item_quantity);
            $('#Item_Detalis').val(result.Item_Detalis);
            $('#myModal').modal('show');
            $('#btnUpdate').show();
            $('#btnAdd').hide();
        },
        error: function (errormessage) {
            alert(errormessage.responseText);
        }
    });
    return false;
}

//function for updating employee's record
function Update() {
    var res = validate();
    if (res == false) {
        return false;
    }
    var AddNeObj = {
        ID: $('#ID').val(),
        Cat_id: $('#Cat_id').val(),
        Item_name: $('#Item_name').val(),
        Item_img: $('#Item_img').val(),
        Item_price: $('#Item_price').val(),
        Item_quantity: $('#Item_quantity').val(),
        Item_Detalis: $('#Item_Detalis').val(),
    };
    $.ajax({
        url: "/Home/Update",
        data: JSON.stringify(AddNeObj),
        type: "POST",
        contentType: "application/json;charset=utf-8",
        dataType: "json",
        success: function (result) {
            loadData();
            $('#myModal').modal('hide');
            $('#ID').val("");
            $('#Cat_id').val("");
            $('#Item_name').val("");
            $('#Item_img').val("");
            $('#Item_price').val("");
            $('#Item_quantity').val("");
            $('#Item_Detalis').val("");
        },
        error: function (errormessage) {
            alert(errormessage.responseText);
        }
    });
}

//function for deleting employee's record
function Delele(ID) {
    var ans = confirm("Are you sure you want to delete this Record?");
    if (ans) {
        $.ajax({
            url: "/Home/Delete/" + ID,
            type: "POST",
            contentType: "application/json;charset=UTF-8",
            dataType: "json",
            success: function (result) {
                loadData();
            },
            error: function (errormessage) {
                alert(errormessage.responseText);
            }
        });
    }
}

//Function for clearing the textboxes
function clearTextBox() {
    $('#ID').val("");
    $('#Cat_id').val("");
    $('#Item_name').val("");
    $('#Item_img').val("");
    $('#Item_price').val("");
    $('#Item_quantity').val("");
    $('#Item_Detalis').val("");
    $('#btnUpdate').hide();
    $('#btnAdd').show();

    $('#Cat_id').css('border-color', 'lightgrey');
    $('#Item_name').css('border-color', 'lightgrey');
    $('#Item_img').css('border-color', 'lightgrey');
    $('#Item_price').css('border-color', 'lightgrey');
    $('#Item_quantity').css('border-color', 'lightgrey');
    $('#Item_Detalis').css('border-color', 'lightgrey');
}
//Valdidation using jquery
function validate() {
    var isValid = true;
    if ($('#Item_name').val().trim() == "") {
        $('#Item_name').css('border-color', 'Red');
        isValid = false;
    }
    else {
        $('#Item_name').css('border-color', 'lightgrey');
    }
    if ($('#Cat_id').val().trim() == "") {
        $('#Cat_id').css('border-color', 'Red');
        isValid = false;
    }
    else {
        $('#Cat_id').css('border-color', 'lightgrey');
    }
    if ($('#Item_img').val().trim() == "") {
        $('#Item_img').css('border-color', 'Red');
        isValid = false;
    }
    else {
        $('#Item_img').css('border-color', 'lightgrey');
    }
    if ($('#Item_price').val().trim() == "") {
        $('#Item_price').css('border-color', 'Red');
        isValid = false;
    }
    else {
        $('#Item_price').css('border-color', 'lightgrey');
    }
    if ($('#Item_quantity').val().trim() == "") {
        $('#Item_quantity').css('border-color', 'Red');
        isValid = false;
    }
    else {
        $('#Item_quantity').css('border-color', 'lightgrey');
    }
    if ($('#Item_Detalis').val().trim() == "") {
        $('#Item_Detalis').css('border-color', 'Red');
        isValid = false;
    }
    else {
        $('#Item_Detalis').css('border-color', 'lightgrey');
    }

    return isValid;
}