function _nvm_auto_use --on-variable PWD
    if test -f .nvmrc; or test -f .node-version
        nvm use --silent
    end
end

_nvm_auto_use
