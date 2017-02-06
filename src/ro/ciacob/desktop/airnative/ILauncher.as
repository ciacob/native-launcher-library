package ro.ciacob.desktop.airnative {
	import flash.filesystem.File;
	
	public interface ILauncher {
		
		/**
		 * Gets an instance of ILauncher optimized to run native, binary executable code.
		 * @throws FeatureNotSupported
		 */
		function get exec() : ILauncher;
		
		/**
		 * Calls into native, binary executable code with no predefined configuration. Used by all convenience 
		 * methods below.
		 * 
		 * @async
		 * 
		 * @param	A file pointing to a native binary executable code.
		 * 
		 * @param	A configuration object.
		 */
		function raw (runnable : File, config : LauncherConfig) : void;
		
		/**
		 * Calls into native, binary executable code; expects that the binary runs once, returns a predictible
		 * value, and exits. If the binary does not exit by itself, it will be forced to close after its first
		 * stdout message.
		 * 
		 * @async
		 * 
		 * @param	runnable
		 * 			A file pointing to a native binary executable code.
		 * 
		 * @param	successPattern
		 * 			A pattern to match against returned stdout output, to decide whether we should consider 
		 * 			execution as successfull.
		 * 
		 * @param	handler
		 * 			A handler object. Optional.
		 * 
		 * @param	args
		 * 			A list of arguments to sent to the executable code. Optional.
		 * 
		 * @see ResultHandler
		 */
		function oneTimeWithConfirmation (runnable : File,
										  successPattern : RegExp,
										  handler : ResultHandler = null,
										  args : Vector.<String> = null) : void;
		
		/**
		 * Calls into native, binary executable code; expects that the binary runs once and exits. No output is expected.
		 * If the binary does not exit by itself in a given timeframe, it will be forced to close.
		 * 
		 * @async
		 * 
		 * @param	runnable
		 * 			A file pointing to a native binary executable code.
		 * 
		 * @param	msecsTimeout
		 * 			The timeframe the runnable is expected to exit in. If it fails to do so, we should consider 
		 * 			execution as failed, and force-close the runnable.
		 */
		function oneTimeWithTimeout (runnable : File, msecsTimeout : Number, sterrHandler : Function = null) : void;
		
		function perpetual (runnable : File, sterrHandler : Function = null) : void;
		
	}
}