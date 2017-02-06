package ro.ciacob.desktop.airnative {
	import flash.filesystem.File;
	
	public class Launcher {
		
		/**
		 * Sets the location of the Windows System Directory. Only required to run system dependant scripts (such 
		 * as BATCH or Windows Scripting Host scripts) on Windows operating systems. 
		 * 
		 * Exapmple: C:\Windows\System32
		 */
		public static function set winSysDir (val : File) : void {}
		
		/**
		 * Sets the location of the main `bin` directory. Only required to run system dependant scripts (such as
		 * bash) on Unix operating systems.
		 */
		public static function set binDir (val : File) : void {}
		
		
		/**
		 * Gets an instance of ILauncher optimized to run native, binary executable code.
		 * @throws FeatureNotSupported
		 */
		public static function get exec() : ILauncher {
			// TODO:
			return null;
		} 
		
		/**
		 * Gets an instance of ILauncher optimized to run Windows BATCH scripts.
		 * @throws FeatureNotSupported
		 */
		public static function get batch() : ILauncher {
			// TODO:
			return null;
		}
		
		/**
		 * Gets an instance of ILauncher optimized to run Windows Scripting Hosts scripts.
		 * @throws FeatureNotSupported
		 */
		public static function get wsh() : ILauncher {
			// TODO:
			return null;
		}
		
		/**
		 * Gets an instance of ILauncher optimized to run Unix scripts.
		 * @throws FeatureNotSupported
		 */
		public static function get bash() : ILauncher {
			// TODO:
			return null;
		}
		
		public function Launcher() {}
	}
}