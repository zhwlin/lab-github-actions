#!/bin/bash

name="v1.0.0-beat333"

# shopt -s nocasematch
prerelease=false
#  if [[ $prerelease == true && ! "$name" =~ ^v?[0-9]+(\.[0-9]+){0,2}(-[a-zA-Z]+[0-9]*)?$ ]]; then
#       echo "Yes, prelease!!!"
#   else 
#       echo "--->>>No, it's release~~~"
#   fi

  if [[ $prerelease == false && "$name" =~ ^v?[0-9]+(\.[0-9]+){0,2}(-[a-zA-Z]+[0-9]*)?$ ]]; then
     echo "No, it's release~~~"
  else 
     echo "==>>Yes, prelease!!!"
  fi

          if [[ ${{github.event.release.prerelease}} == false && "${{github.ref_name}}" =~ ^v?[0-9]+(\.[0-9]+){0,2}(-[a-zA-Z]+[0-9]*)?$ ]]; then
            ./gradlew publishToExternalRepository -x test --parallel
          else
            ./gradlew publishToInnerRepository -DIS_DEV=true -DIS_SNAPSHOT=true -x test --parallel
          fi  