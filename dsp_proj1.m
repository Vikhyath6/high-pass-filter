[y, Fs] = audioread("C:\Users\Vikhyath\Downloads\Post1.wav");

% Define the cutoff frequency for the high-pass filters
highpass_cutoff = 300; % Cutoff frequency in Hz

% Filter design

% FIR filter design using the window method
fir_order = 220; % Filter order (adjust as needed)
fir_filter = fir1(fir_order, highpass_cutoff/(Fs/2), 'high');

% IIR filter design (Butterworth)
iir_order = 9; % Filter order (adjust as needed)
[iir_b, iir_a] = butter(iir_order, highpass_cutoff/(Fs/2), 'high');

% Apply the filters to the audio signal using the 'filter' function
filtered_audio_fir = filter(fir_filter, 1, y);
filtered_audio_iir = filter(iir_b, iir_a, y);

% Listen to the original and filtered audio signals
sound(y, Fs); % Play the original audio
pause(20); % Pause for 5 seconds before playing filtered audio
sound(filtered_audio_fir, Fs); % Play the filtered audio (FIR)
pause(20); % Pause for 5 seconds before playing another filtered audio
sound(filtered_audio_iir, Fs); % Play the filtered audio (IIR)

% Plot the waveform of the original and filtered audio signals
t = (0:length(y)-1) / Fs;
figure;
subplot(3,1,1);
plot(t, y);
title('Original Audio');
xlabel('Time (s)');
ylabel('Amplitude');
subplot(3,1,2);
plot(t, filtered_audio_fir);
title('Filtered Audio (FIR)');
xlabel('Time (s)');
ylabel('Amplitude');
subplot(3,1,3);
plot(t, filtered_audio_iir);
title('Filtered Audio (IIR)');
xlabel('Time (s)');
ylabel('Amplitude');