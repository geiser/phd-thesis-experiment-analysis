# Data Employed in the Statistical Analysis of the Pilot Empirical Study

## [SignedUpParticipants.csv](SignedUpParticipants.csv)

CSV-file with the list of all students enrolled as participants in the pilot empirical study.
- On-line visualization: [SignedUpParticipants.csv](https://github.com/geiser/phd-thesis-evaluation/blob/master/pilot-study/data/SignedUpParticipants.csv)

| Column | Description |
|--------|----------|
| UserID | Integer as user identification to differentiate students on the empirical study |
| Type | Type of CL session in which the student with *UserID* participated in the empirical study |
| CLGroup | Name for the CL group in which the student with *UserID* is member of |
| CLRole | The CL role assigned for the student with *UserID* |
| PlayerRole | The player role assigned for the student with *UserID* in ont-gamified CL sessions |


## [CLActivity.csv](CLActivity.csv)

CSV-file with information related to the execution of CL sessions in the pilot empirical study.
- On-line visualization: [CLActivity.csv](https://github.com/geiser/phd-thesis-evaluation/blob/master/pilot-study/data/CLActivity.csv)

| Column | Description |
|--------|----------|
| UserID | Integer as user identification to differentiate students on the empirical study |
| Type | Type of CL session in which the student with *UserID* participated in the empirical study |
| CLGroup | Name for the CL group in which the student with *UserID* is member of |
| CLRole | The CL role assigned for the student with *UserID* |
| PlayerRole | The player role assigned for the student with *UserID* in ont-gamified CL sessions |
| ParticipationLevel | Participation level of students in the CL sessions |
| NroNecessaryInteractions | Number of necessary interactions performed by the students with *UserID* |
| NroDesiredInteractions | Number of desired interactions performed by the students with *UserID* |
| NroTotalInteractions | Number of necessary and desired interactions performed by the students with *UserID* |
| NroSolutionReviewed (Apprentice) | Number of solutions sent by the apprentice student with *UserID* and reviewed for a master student |
| NroSolutionReviewed (Master) | Number of solutions reviewed by the master student with *UserID* |
| NroSolutionWithoutReviewed (Apprentice) | Number of solutions without review sent by the apprentice student with *UserID* but without review for a master student |
| NroSolutionWithoutReviewed (Master) | Number of solutions sent to the master student with *UserID* and with pending review | 
| (n) ... | Number of necessary interactions with the identificador (*n*) carried out by the student with *UserID* |
| (x) ... | Number of desired interactions with the identificador (*x*) carried out by the student with *UserID* |

The possible values for the column *ParticipationLevel* are:
* _none_ is the participation level in which the students did not interact with other members in the CL sessions.
* _incomplete_ is the participation level in which the students interacted in the CL sessions, but they did not complete all the necessary interactions.
* _semicomplete_ is the participation level in which the students interacted in the CL sessions performing all the necessary interactions, but that they did not respond all the requests made by other members of the CL group.
* _complete_ is the participation level in which the students interacted in CL sessions performing all the necessary interactions, and they answered all the requests made by other members of the CL group.


## [EffectiveParticipants.csv](EffectiveParticipants.csv)

CSV-file with the list of students with *effective* participation in the pilot empirical study.
- On-line visualization: [EffectiveParticipants.csv](https://github.com/geiser/phd-thesis-evaluation/blob/master/pilot-study/data/EffectiveParticipants.csv)

| Column | Description |
|--------|----------|
| UserID | Integer as user identification to differentiate students on the empirical study |
| Type | Type of CL session in which the student with *UserID* participated in the empirical study |
| CLGroup | Name for the CL group in which the student with *UserID* is member of |
| CLRole | The CL role assigned for the student with *UserID* |
| PlayerRole | The player role assigned for the student with *UserID* in ont-gamified CL sessions |

*effective*: A student with effective participation is a student that, at least one time, interacted with other member
of the CL group by following the necessary interactions indicated in the CSCL script. It is a students who had a complete,
semicomplete or incomplete participation level in the CL session.