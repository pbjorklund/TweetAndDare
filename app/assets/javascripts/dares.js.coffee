$ ->
  $('a.vote-dont, a.vote-do').live 'ajax:complete', (e,resp,xhr) ->
    votesHash = $.parseJSON(resp.responseText)
    $(@).parent().find('.vote-do span.votes-count').text(votesHash.likes)
    $(@).parent().find('.vote-dont span.votes-count').text(votesHash.dislikes)
