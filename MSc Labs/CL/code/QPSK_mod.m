function Y = QPSK_mod(bit_seq, symbol_num, H, N, n_all, SNR)
mod_seq = zeros(N,symbol_num);
Y = zeros(N,symbol_num);
%% sending bit squence
for i = 1:symbol_num
    for j = 1:N
        bit_1 = bit_seq(j, 2*i-1);
        bit_2 = bit_seq(j, 2*i);
        mod_seq(j,i) = QPSK_map(bit_1, bit_2);              
    end
    x = [mod_seq(1,i); mod_seq(2,i)];
    % gaussian noise with unit variacne
    n = n_all(i,:)';
    y = sqrt(SNR / N) * H * x + n;
    Y(:,i) = y;
end
end