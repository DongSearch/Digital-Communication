%
% DiCo Lab course Summer2025
% My MATLAB and DiCo Test
% My name is Gidong Baek
%
 
M = 16
% set length N to value 
N = 100
 
% Task 5
% 16-ASK unipolar 
seq_sig_const_1 = task2(M,N,0)
% 16-ASK bipolar
seq_sig_const_2 = task2(M,N,1)
% 16-QAM (make two 4ASK, and use one for imaginary part, another one for
% quadrature part.
seq_sig_const_3 = task2(4,N,1)+1j*task2(4,N,1);
 
figure(1);
subplot(3,1,1)
stem(seq_sig_const_1)
title('16-ASK unipolar')
subplot(3,1,2)
stem(seq_sig_const_2)
title('16-ASK bipolar')
subplot(3,1,3)
scatter(real(seq_sig_const_3),imag(seq_sig_const_3),'filled');
title('16-QAM bipolar')

 
% Task 6
N = 10000;
% Sampling
seq_sig_const_1 = task2(M,N,0);
% folmula of papr
papr_16_A_U = max(seq_sig_const_1.^2) / mean(abs(seq_sig_const_1).^2);
% turn it to dB
db_papr_16_A_U = 10*log10(papr_16_A_U);

% same 
seq_sig_const_2 = task2(M,N,1);
papr_16_A_B = max(seq_sig_const_2.^2) / mean(abs(seq_sig_const_2).^2);
db_papr_16_A_B = 10*log10(papr_16_A_B);

% same, but we use real and imaginary part here, so we need to use abs in max part 
seq_sig_const_3 = task2(4,N,1) + 1j * task2(4,N,1);
papr_16_Q = max(abs(seq_sig_const_3).^2) / mean(abs(seq_sig_const_3).^2);
db_papr_16_Q = 10*log10(papr_16_Q);

fprintf('PAPR (16-ASK unipolar): %.2f dB, given on in tabular : 4.63 dB \n',db_papr_16_A_U);
fprintf('PAPR (16-ASK bipolar): %.2f dB, given on in tabular : 4.23 dB \n',db_papr_16_A_B);
fprintf('PAPR (16-QAM): %.2f dB, given on in tabular : 2.55 dB \n',db_papr_16_Q);