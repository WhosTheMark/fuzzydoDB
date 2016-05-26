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
      { "orderable": false, "searchable": false },
      { "orderable": false, "searchable": false }
    ]
  });
}

// adds information to the user deletion modal
function setDeleteModal() {
  $('#deleteConfirmationModal').on('show.bs.modal', function (event) {
    var button = $(event.relatedTarget);
    var username = button.data('username');
    var template = I18n.t("admin.delete-user-confirmation");

    template = template.replace("${username}", username);

    var modal = $(this);
    modal.find('.modal-body').text(template);

    modal.find('#deleteBtn').attr('href', button.data('delete-url'));
  })
}

$(document).ready(function() {
  initializeUserTable();
  setDeleteModal();
});


