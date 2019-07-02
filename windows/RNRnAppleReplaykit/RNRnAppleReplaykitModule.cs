using ReactNative.Bridge;
using System;
using System.Collections.Generic;
using Windows.ApplicationModel.Core;
using Windows.UI.Core;

namespace Rn.Apple.Replaykit.RNRnAppleReplaykit
{
    /// <summary>
    /// A module that allows JS to share data.
    /// </summary>
    class RNRnAppleReplaykitModule : NativeModuleBase
    {
        /// <summary>
        /// Instantiates the <see cref="RNRnAppleReplaykitModule"/>.
        /// </summary>
        internal RNRnAppleReplaykitModule()
        {

        }

        /// <summary>
        /// The name of the native module.
        /// </summary>
        public override string Name
        {
            get
            {
                return "RNRnAppleReplaykit";
            }
        }
    }
}
