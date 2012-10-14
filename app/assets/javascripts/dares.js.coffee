$ ->
  $('a.vote-dont, a.vote-do').live 'ajax:complete', (e,resp,xhr) ->
    votesHash = $.parseJSON(resp.responseText)
    console.log $(@).parent().find('.vote-do span.votes-count').text(votesHash.likes)
    console.log $(@).parent().find('.vote-dont span.votes-count').text(votesHash.dislikes)

