# Override if this settings present
if [[ ! -z "${USE_ENV_VAR}" ]]; then
    # Local.
    export KOBOFORM_URL="${KOBOFORM_URL}"
    export ENKETO_URL="${ENKETO_URL}"
    export CSRF_COOKIE_DOMAIN="${CSRF_COOKIE_DOMAIN}"
    export DJANGO_ALLOWED_HOSTS="${DJANGO_ALLOWED_HOSTS}"
elif [[ ! -z "${PUBLIC_DOMAIN_NAME}" ]]; then
    # Server configuration.
    export KOBOFORM_URL="https://${KOBOFORM_PUBLIC_SUBDOMAIN}.${PUBLIC_DOMAIN_NAME}"
    export ENKETO_URL="https://${ENKETO_EXPRESS_PUBLIC_SUBDOMAIN}.${PUBLIC_DOMAIN_NAME}"
    export CSRF_COOKIE_DOMAIN=".${PUBLIC_DOMAIN_NAME}"
    export DJANGO_ALLOWED_HOSTS=".${PUBLIC_DOMAIN_NAME}"
elif [[ ! -z "${HOST_ADDRESS}" ]]; then
    # Local.
    export KOBOFORM_URL="http://${HOST_ADDRESS}:${KPI_PUBLIC_PORT}"
    export ENKETO_URL="http://${HOST_ADDRESS}:${ENKETO_EXPRESS_PUBLIC_PORT}"
    export CSRF_COOKIE_DOMAIN="${HOST_ADDRESS}"
    export DJANGO_ALLOWED_HOSTS="${HOST_ADDRESS}"
else
    echo 'Please fill out your `envfile`!'
    exit 1
fi

export KOBOCAT_AWS_ACCESS_KEY_ID="${AWS_ACCESS_KEY_ID}"
export KOBOCAT_AWS_SECRET_ACCESS_KEY="${AWS_SECRET_ACCESS_KEY}"
export KPI_URL="${KOBOFORM_URL}"
export DJANGO_DEBUG="${KOBOCAT_DJANGO_DEBUG}"
export RAVEN_DSN="${KOBOCAT_RAVEN_DSN}"
