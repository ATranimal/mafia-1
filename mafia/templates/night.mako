<%! from mafia.views.night import NoTargetForm, TargetForm, SkipForm %>
<form id="night-action" action="/play" method="POST">
% if action.name == "mafia kill":
<h2>Mafia Kill</h2>
% else:
% if game.is_modless:
<h2>${player.role_name}'s ${action.name} action</h2>
% else:
<h2>${player.name} (${player.role_name})'s ${action.name} action</h2>
% endif
% endif

% if isinstance(form, NoTargetForm):
${form.choice()}
% elif isinstance(form, TargetForm):
    % for target in form.targets:
    ${target()}
    % endfor
%endif

${form.submit()}
</form>
