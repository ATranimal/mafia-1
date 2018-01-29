<%! from mafia.views.night import NoTargetForm, TargetForm, SkipForm %>
<form id="night-action" action="/play" method="POST">
## Assume that no mafia role has the "kill" night action.
## I don't think that's an unreasonable assumption.
% if action.name == "mafia kill":
<h2>Mafia Kill</h2>
% else:
<h2>${player.name} (${player.role_name})'s ${action.name} action</h2>
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
