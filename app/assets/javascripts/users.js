// Place all the behaviors and hooks related to the matching controller here.
// All this logic will automatically be available in  application.js.

/// <reference path="../typings/jquery.d.ts" />
/// <reference path="../typings/jquery.dataTables.d.ts" />
/// <reference path="../typings/jquery.dataTables.d.ts" />

function initializeUserTable() {

  $('#userTable').DataTable({
    language: {
      url: I18n.t("tables.language")
    },
    columns: [
      null,
      null,
      null,
      { "orderable": false, "searchable": false },
      { "orderable": false, "searchable": false }
    ]
  });
}

$(document).ready(initializeUserTable);


