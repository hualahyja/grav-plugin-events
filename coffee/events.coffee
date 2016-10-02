(($) ->
  $(document).ready ->

    # Function to change the page url
    ChangeUrl = (page, url) ->
      if typeof history.pushState != 'undefined'
        obj =
          Page: page
          Url: url
        history.pushState obj, obj.Page, obj.Url
      else
        alert 'Browser does not support HTML5.'
      return

    # Calendar Controls
    $('.calendar').on 'click', 'a.calendar-control', (event) ->
      href = $(this).attr('href')
      $.get href, (data) ->
        $calendar = $('table.calendar', data)
        $('table.calendar').html $calendar
        return
      ChangeUrl document.title, href
      event.preventDefault()
      false

    # Calendar Modal
    $('.calendar-day-link').on 'click', (event) ->
      title = $(this).attr('title');
      content = $(this).parent().next('.events-list').html();
      $('.calendar-modal-title').html(title);
      $('.calendar-modal-content').html(content);
      $('.calendar-modal').fadeIn(100);
      event.preventDefault()
      false

    # Close calendar modal on click
    $('.calendar-close-modal').on 'click', (event) ->
      $('.calendar-modal').fadeOut(100);
      event.preventDefault()
      false

    # Close calendar modal on esc press
    $(document).keyup (event) ->
      if (event.keyCode == 27)
        $('.calendar-modal').fadeOut(100);

    # Close calendar modal on outside click
    $(document).on 'click', (event) ->
      if ( ! $(event.target).closest('.calendar-modal-inner').is(":visible") )
        $('.calendar-modal').fadeOut(100);

    return
  return
) jQuery

# ---
# generated by js2coffee 2.2.0
