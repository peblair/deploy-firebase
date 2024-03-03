#!/bin/bash

if [ -z "${FIREBASE_TOKEN}" ]; then
    echo "FIREBASE_TOKEN is missing"
    exit 1
fi

if [ -z "${FIREBASE_PROJECT}" ]; then
    echo "FIREBASE_PROJECT is missing"
    exit 1
fi

if [ -z "{USE_PIPENV}" ]; then
    FIREBASE=firebase
else
    FIREBASE="pipenv run firebase"
fi

$FIREBASE deploy \
    -m "${GITHUB_REF} (${GITHUB_SHA})" \
    --project ${FIREBASE_PROJECT} \

