% Glasgow Kiss improv by Shimon

%Chords in Glasgow Kiss
% E, B, F#m, G, A, D, Bm, Ebm, Abm, Dbm, Ab, F#
% Emajor, B mixolydian, F#dorian, Gphrygian, Alydian, Dmixolydian,
% dorians/harmonic minors for the rest, except F#mixolydian

%Emmission probabilities for chords, in order used above. C3 to C7 range
%for Shimon, but emmission matrix starts from C1 to C8
%[ C, C#, D, D#, E, F, F#, G, G#, A, Bb, B]

% Only notes in chords get probabilities
chord_note_matrix = zeros(12,12);

% Root gets higher probability
% chord_note_matrix(1 , :) = [0, 0, 0, 0, 0.4, 0, 0, 0, 0.3, 0, 0, 0.3];
% chord_note_matrix(2 , :) = [0, 0, 0, 0.3, 0, 0, 0.3, 0, 0, 0, 0, 0.4];
% chord_note_matrix(3 , :) = [0, 0.3, 0, 0, 0, 0, 0.4, 0, 0, 0.3, 0, 0];
% chord_note_matrix(4 , :) = [0, 0, 0.3, 0, 0, 0, 0, 0, 0.4, 0, 0, 0.3];
% chord_note_matrix(5 , :) = [0, 0.3, 0, 0, 0.3, 0, 0, 0, 0, 0.4, 0, 0];
% chord_note_matrix(6 , :) = [0, 0, 0.4, 0, 0, 0, 0.3, 0, 0, 0.3, 0, 0];
% chord_note_matrix(7 , :) = [0, 0, 0.3, 0, 0, 0, 0.3, 0, 0, 0, 0, 0.4];
% chord_note_matrix(8 , :) = [0, 0, 0, 0.4, 0, 0, 0.3, 0, 0, 0, 0.3, 0];
% chord_note_matrix(9 , :) = [0, 0, 0, 0.3, 0, 0, 0, 0, 0.4, 0, 0, 0.3];
% chord_note_matrix(10, :) = [0, 0.4, 0, 0, 0.3, 0, 0, 0, 0.3, 0, 0, 0];
% chord_note_matrix(11, :) = [0.3, 0, 0, 0.3, 0, 0, 0, 0, 0.4, 0, 0, 0];
% chord_note_matrix(12, :) = [0, 0.3, 0, 0, 0, 0, 0.4, 0, 0, 0, 0.3, 0];

%All notes get equal probability: Only notes in chord
chord_note_matrix(1 , :) = [0, 0, 0, 0, 1/3, 0, 0, 0, 1/3, 0, 0, 1/3];
chord_note_matrix(2 , :) = [0, 0, 0, 1/3, 0, 0, 1/3, 0, 0, 0, 0, 1/3];
chord_note_matrix(3 , :) = [0, 1/3, 0, 0, 0, 0, 1/3, 0, 0, 1/3, 0, 0];
chord_note_matrix(4 , :) = [0, 0, 1/3, 0, 0, 0, 0, 1/3, 0, 0, 0, 1/3];
chord_note_matrix(5 , :) = [0, 1/3, 0, 0, 1/3, 0, 0, 0, 0, 1/3, 0, 0];
chord_note_matrix(6 , :) = [0, 0, 1/3, 0, 0, 0, 1/3, 0, 0, 1/3, 0, 0];
chord_note_matrix(7 , :) = [0, 0, 1/3, 0, 0, 0, 1/3, 0, 0, 0, 0, 1/3];
chord_note_matrix(8 , :) = [0, 0, 0, 1/3, 0, 0, 1/3, 0, 0, 0, 1/3, 0];
chord_note_matrix(9 , :) = [0, 0, 0, 1/3, 0, 0, 0, 0, 1/3, 0, 0, 1/3];
chord_note_matrix(10, :) = [0, 1/3, 0, 0, 1/3, 0, 0, 0, 1/3, 0, 0, 0];
chord_note_matrix(11, :) = [1/3, 0, 0, 1/3, 0, 0, 0, 0, 1/3, 0, 0, 0];
chord_note_matrix(12, :) = [0, 1/3, 0, 0, 0, 0, 1/3, 0, 0, 0, 1/3, 0];

%All notes not in chord get equal probability: All notes in scale
chord_note_matrix(1 , :) = [0, 1/7, 0, 1/7, 1/7, 0, 1/7, 0, 1/7, 1/7, 0, 1/7];
chord_note_matrix(2 , :) = [0, 1/7, 0, 1/7, 1/7, 0, 1/7, 0, 1/7, 1/7, 0, 1/7];
chord_note_matrix(3 , :) = [0, 1/7, 0, 1/7, 1/7, 0, 1/7, 0, 1/7, 1/7, 0, 1/7];
chord_note_matrix(4 , :) = [1/7, 0, 1/7, 0, 1/7, 0, 1/7, 1/7, 0, 1/7, 0, 1/7]; %Gmajor
chord_note_matrix(5 , :) = [0, 1/7, 0, 1/7, 1/7, 0, 1/7, 0, 1/7, 1/7, 0, 1/7];
chord_note_matrix(6 , :) = [1/7, 0, 1/7, 0, 1/7, 0, 1/7, 1/7, 0, 1/7, 0, 1/7];
chord_note_matrix(7 , :) = [0, 1/7, 1/7, 0, 1/7, 0, 1/7, 1/7, 0, 1/7, 0, 1/7]; %B natural minor
chord_note_matrix(8 , :) = [0, 0, 1/7, 1/7, 0, 1/7, 1/7, 0, 1/7, 0, 1/7, 1/7]; %Eb harmonic minor
chord_note_matrix(9 , :) = [0, 1/7, 0, 1/7, 1/7, 0, 0, 1/7, 1/7, 0, 1/7, 1/7]; %Ab harmonic minor
chord_note_matrix(10, :) = [1/7, 1/7, 0, 1/7, 1/7, 0, 1/7, 0, 1/7, 1/7, 0, 0]; %C# harmonic minor
chord_note_matrix(11, :) = [0, 1/7, 0, 1/7, 0, 1/7, 1/7, 0, 1/7, 0, 1/7, 1/7];
chord_note_matrix(12, :) = [0, 1/7, 0, 1/7, 1/7, 0, 1/7, 0, 1/7, 0, 1/7, 1/7];


%Generate emmission probabilities
Emmission = zeros(12, 23);
for i = 2:9
    Emmission = cat(2, Emmission, chord_note_matrix);
end
Emmission = cat(2, Emmission, zeros(12, 9));
Emmission = Emmission./8;

%Get transition probabilities
[t1,t2] = midi2transitionmats();


%% Algorithmically select rhythmic structure
%Define chord progressions and rhythms: 12/8 song
%rhythms: larger number means shorter notes, basically inverse of the note
%duration.
% rhythms = [{8,8,8,8,8,8,8,8,8,8,8,8}, 
%     {8,8,8,16,16,8,8,8,8,8,8,8,8}, 
%     {4,4,4,2,4},
%     {16,16,4,8,8,8,16,16,8,8,8,8,8},
%     {16,16,16,16,16,16,8,16,16,16,8,16,16,16,16,16,16,8,16,8}];

%chord_progressions: Stupid hack 

%% Hard coded rhythmic structure:

%chord mappings once again: E, B, F#m, G, A, D, Bm, Ebm, Abm, Dbm, Ab, F#
%                           1  2  3    4  5  6  7   8    9    10   11  12

%chord_sequence = [1 2 3; 1 4 5; 1 5 1 4 6; 1 5 1 4  5; 1 7; 6 1 5; 1 2; 3 4; 2 5 6 1; 3 1 2];
%duration = [12, 12, 12, ]

load('data.mat');

min = 1e-10; % choose a small non-zero value
t1 ( t1 < min) = min; 
Emmission ( Emmission < min) = min; 

note_sequence = hmmdecode(first_section(:,2)', t1, Emmission');
% [~, seq] = max(note_sequence,[],1);
for i = 1:size(first_section,1)
    note(i) = pick_num(note_sequence(:,i)',1:128);
end

tempo = 207;
append = intro; 
note2midi(first_section, note, tempo, append, intro_chords);