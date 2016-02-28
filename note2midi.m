function [] = note2midi(section, notes, tempo, append, intro_chords)

notes = [append(:,1)', notes, append(:,1)'];
section = [intro_chords; section(:,1:2); intro_chords];
intervals = section(:,1);
duration = intervals/max(intervals)*2;
duration = duration.^-1;

time_per_beat = 60/tempo;
duration = duration*time_per_beat;

note_on = zeros(1, numel(notes));

note_on(1) = 0;
for i = 2:numel(notes)
    note_on(i) = note_on(i-1) + duration(i-1);
end
note_off = note_on + duration';

for i = 1:numel(notes)
    while(notes(i) < 48)
        notes(i) = notes(i) + 12;
    end
end
% initialize matrix:
N = numel(notes);  % number of notes
M = zeros(N,6);

M(:,1) = 1;         % all in track 1
M(:,2) = 1;         % all in channel 1
M(:,3) = notes';      % note numbers: one ocatave starting at middle C (60)
M(:,4) = round(linspace(80,120,N))';  % lets have volume ramp up 80->120
M(:,5) = note_on';  % note on:  notes start every .5 seconds
M(:,6) = note_off';   % note off: each note has duration .5 seconds

midi_new = matrix2midi(M);
writemidi(midi_new, 'new.mid');
end