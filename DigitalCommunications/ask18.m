str=' Missiles are thus also called guided missiles or guided rockets (when in rocket form). Missiles have five system components: targeting, guidance system, flight system, engine and warhead.';
message=str;
syms=[];

prob=[];
n=length(message);
i=1;
while ~isempty(message)
    [char,no_occurrances]=mode(message);
    syms(i)=char;
    prob(i)=no_occurrances;
    indices=find(message==char);
    message(indices)='';
    i=i+1;
end
prob=prob/n;
disp('probabilities: ')
display(transpose(prob))
s = sum(prob);
disp(['pob sum: ' num2str(s)])


% Source entropy calculation
Hi=prob.*log2(1./(prob));
entropy=sum(Hi)
