
prob=[0.2 0.05 0.03 0.1 0.3 0.02 0.22 0.08];
syms = ['k' 'g' 'h' 'd' 'v' 'e' 't' 'q'];
n = length(syms);
seq = [];

% Calculating the Symbol Sequence from symbol probabilities 
for i = 1:1:n
    t = prob(i)*200;
    for j = 1:1:t
        seq = [seq syms(i)];
    end
end
u = uint8(syms);

% Huffman Encoding using the huffman dictionary
[dict,~]= huffmandict(u, prob);

for i = 1:1:n
    bin = huffmanenco(syms(i), dict);
    bin = transpose(bin);
    output = ['x', num2str(i), ' probability: ', num2str(prob(i)), '     codeword:--->'];
    disp(output)
    disp(num2str(bin))    
end
