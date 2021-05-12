function[all_var] = all_parameters(audio_file)    % Audio file contains the name of the input .wav file


% [x fs nibits] = wavread(audio_file);
% 
% 
% xm = x(:,1)';  % Converts 2d .wav file to 1d coloumn vector

xm = audio_file;

[xmod mwin energy Env] = STE_STZCR(xm,length(xm));



%%%%%%%%%%%%%%%%%%%%%%%%%%zero crossing%%%%%%%%%%%%%%%%%%%%%
zcr=zeroxing21n(xmod);
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%


% Spectral Roll-off %

sro = spectral_roll(xmod, 44100);

% Spectral Roll-off ends here %



% For sniper_002.wav matching %

[xsmg fsmg] = audioread('sniper_002.wav');
xsmg = (xsmg(:,1))';
[xsmg mwinsmg esmg Envsmg] = STE_STZCR(xsmg,length(xsmg));
predict = predictor(xsmg);
[error_smg] = LP_estimate1(xmod, length(xmod), predict);
cor_smg_t = max((xcorr(xmod, xsmg)));
cor_smg_f =abs( max((xcorr(fft(xmod), fft(xsmg)))));

cor_smg_Envt=max((xcorr(Env, Envsmg)));

% sniper_002.wav matching Ends here %


% For magnum_005.wav matching %

[xmag fmag] = audioread('magnum_005.wav');
xmag = (xmag(:,1))';
[xmag mwinmag emag Envmag]  = STE_STZCR(xmag,length(xmag));
predict = predictor(xmag);
[error_mag] = LP_estimate1(xmod, length(xmod), predict);
cor_mag_t = max((xcorr(xmod, xmag)));
cor_mag_f = abs(max((xcorr(fft(xmod), fft(xmag)))));

cor_mag_Envt=max((xcorr(Env, Envmag)));
% magnum_005.wav matching Ends here %


% For rifle001.wav matching %

[xrif frif] = audioread('rifle001.wav');
xrif = (xrif(:,1))';
[xrif mwinrif erif Envrif] = STE_STZCR(xrif,length(xrif));
predict = predictor(xrif);
[error_rif] = LP_estimate1(xmod, length(xmod), predict);
cor_rif_t = max((xcorr(xmod, xrif)));
cor_rif_f = abs(max((xcorr(fft(xmod), fft(xrif)))));

cor_rif_Envt=max((xcorr(Env, Envrif)));

% rifle001.wav matching Ends here %


% % For ak47001.wav matching %
% 
% [xak fak nibts] = wavread('ak47_001.wav');
% xak = (xak(:,1))';
% [xak mwinak erak Envak] = STE_STZCR(xak,length(xak));
% predict = predictor(xak);
% [error_ak] = LP_estimate1(xmod, length(xmod), predict);
% cor_ak_t = max((xcorr(xmod, xak)));
% cor_ak_f = max((xcorr(fft(xmod), fft(xak))));
% 
% cor_ak_Envt=max((xcorr(Env, Envak)));


all_var = [mwin energy zcr sro error_smg cor_smg_t cor_smg_f cor_smg_Envt error_mag cor_mag_t cor_mag_f cor_mag_Envt error_rif cor_rif_t cor_rif_f cor_rif_Envt];

% ak47001.wav matching Ends here %


% [X f] = tnf_response(xm, fs, audio_file);   % where X is the f-spectrum of input 'x' sound

%sr = spectral_rolloff(xmod, f, fs, audio_file);


end
