// Place all the behaviors and hooks related to the matching controller here.
// All this logic will automatically be available in application.js.

/// <reference path="../typings/jquery.d.ts" />
/// <reference path="../typings/jquery.dataTables.d.ts" />

function initializeUserTable() {
  $('#userTable').DataTable({
    "columns": [
      null,
      null,
      null,
      { "orderable": false, "searchable": false },
      { "orderable": false, "searchable": false }
    ]
  });
}

$(document).on('page:change', initializeUserTable);