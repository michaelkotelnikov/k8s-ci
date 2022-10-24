#! /bin/bash

conftest test --policy conftest/ manifests/
yamllint manifests/ -d yamllint/conf.yaml
yamllint demo-chart/templates/ -d yamllint/conf.yaml