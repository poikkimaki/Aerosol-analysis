function [ fN ] = wiedensohler( Dp, N )
% Wiedensohlerin kaava N varaus (-2, -1, 1, 2) ja Dp hiukkaskoko
% Laskee Wiedensohlerin kaavan mukaisesti N varauksen omaavien hiukkasten
% Dp(nm)osuuden f(N) kaikista hiukkasista käyttäen kertoimia a(N)

% valitaan wiedensohler kerroin vektori a(N)
if N == -2
    a = [-26.3328, 35.9044, -21.4608, 7.0867, -1.3088, 0.1051]; % a(-2)
    
elseif N == -1
    a = [-2.3197, 0.6175, 0.6201, -0.1105, -0.1260, 0.0297]; % a(-1)
        
elseif N == 1
    a = [-2.3484, 0.6044, 0.4800, 0.0013, -0.1553, 0.0320]; % a(1)
        
elseif N == 2
    a = [-44.4756, 79.3772, -62.8900, 26.4492, -5.7480, 0.5049]; % a(2)
else
    assert (false, 'N ei ole -2, -1, 1 tai 2') % jos syötetty arvo väärä
end

% silmukassa lasketaan summa osuus
summa = 0;
for i = 1:6
   n =  a(i)*log10(Dp)^(i-1); % summan yksi alkio
   summa = summa + n; % kumuloituva summa
end

log10_fN = summa; % wiedensohlerin yhtälön toinen puoli
fN = 10^(log10_fN); % hiukkasten osuus f(N)

end

