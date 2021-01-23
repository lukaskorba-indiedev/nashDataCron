script='query 
  league($competitionId: ID!, $type: SoloRankingType!) {
listCompetitions {
      id
      volume {
        amount
      }
    },
    listSoloRankings(competitionId: $competitionId, type: $type) {
      name
      volume {
        amount
      }
    },
    listTeams(competitionId: $competitionId) {
      name
      memberCount
      teamMembers {
        name
        volume {
          amount
        }
      }
      volume {
        amount
      }
    }
  }
'

variables='{ \"competitionId\": \"53dc0843-b77d-4f33-829d-ec72fb86ee55\",
  \"type\": \"TOTAL_VOLUME\"
}
'

now=$(date +"%b %d, %r")


script="$(echo $script)"   # the query should be onliner, without newlines
variables="$(echo $variables)"   # the query should be onliner, without newlines

curl -H 'Content-Type: application/json' \
   -X POST -d "{ \"query\": \"$script\", \"variables\": \"$variables\" }" https://app.nash.io/api/graphql/explore -o "$now.json"


