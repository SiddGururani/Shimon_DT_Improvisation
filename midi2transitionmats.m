function [t_notes, t_duration] = midi2transitionmats()

midifiles = dir('./midi/*.mid');
path = './midi/';
transition_notes = zeros(128,128);
transition_duration = zeros(10,10);
c = 0;
for i = 1: numel(midifiles)
    fname = midifiles(i).name;
    midi = readmidi([path,fname]);
    [Notes, endtime] = midiInfo(midi,0,1);
    durations = Notes(:,6)-Notes(:,5);
    c = c+size(Notes,1);
    steps = 100;
    num_windows = floor(numel(durations)/steps);
    for j = 1:num_windows
        window = durations((j-1)*steps+1:j*steps);
        tempo = min(window);
        durations((j-1)*steps+1:j*steps) = round(window/tempo);
    end
    durations(num_windows*steps+1:end) = round(durations(num_windows*steps+1:end)/tempo);
    transition_notes = transition_notes + getTransitionMatrix(Notes(:,3)',1,128);
    durations(durations > 10) = 10;
    transition_duration = transition_duration + getTransitionMatrix(durations',1,10);
end

t_notes = transition_notes./numel(midifiles);
t_duration = transition_duration./numel(midifiles);

end