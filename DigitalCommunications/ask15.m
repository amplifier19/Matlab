% Store string str into myname variable
myname = 'my name is Dimitris';
str = myname; 

% prob = probability vector
prob=[];
syms=[];
i=1;
while ~isempty(str)
    [char,no_occurrences]=mode(str);
    syms(i)=char;
    prob(i)=no_occurrences;
    indices=find(str==char);
    str(indices)='';
    i=i+1;
end
n=length(myname);
prob=prob/n;

% Huffman Encoding using the huffman dictionary
[dict,avglength]= huffmandict(syms, prob);
binstream = huffmanenco(myname, dict);
msgdeco= huffmandeco(binstream, dict);

% Check the if the initial and the decoded message are the same
isequal(myname,msgdeco)

% Source entropy calculation
Hi=prob.*log2(1./(prob+1e-9));
entropy=sum(Hi)

% Code efficiency percentage
code_eff=(entropy/avglength)*100

% Huffman code redunduncy percentage
code_red=(1-(entropy/avglength))*100


