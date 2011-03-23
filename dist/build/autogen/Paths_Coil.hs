module Paths_Coil (
    version,
    getBinDir, getLibDir, getDataDir, getLibexecDir,
    getDataFileName
  ) where

import Data.Version (Version(..))
import System.Environment (getEnv)

version :: Version
version = Version {versionBranch = [0,0,1], versionTags = []}

bindir, libdir, datadir, libexecdir :: FilePath

bindir     = "/home/darkscythe/.cabal/bin"
libdir     = "/home/darkscythe/.cabal/lib/Coil-0.0.1/ghc-6.12.1"
datadir    = "/home/darkscythe/.cabal/share/Coil-0.0.1"
libexecdir = "/home/darkscythe/.cabal/libexec"

getBinDir, getLibDir, getDataDir, getLibexecDir :: IO FilePath
getBinDir = catch (getEnv "Coil_bindir") (\_ -> return bindir)
getLibDir = catch (getEnv "Coil_libdir") (\_ -> return libdir)
getDataDir = catch (getEnv "Coil_datadir") (\_ -> return datadir)
getLibexecDir = catch (getEnv "Coil_libexecdir") (\_ -> return libexecdir)

getDataFileName :: FilePath -> IO FilePath
getDataFileName name = do
  dir <- getDataDir
  return (dir ++ "/" ++ name)
