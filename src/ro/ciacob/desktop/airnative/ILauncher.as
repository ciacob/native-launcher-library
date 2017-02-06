package ro.ciacob.desktop.airnative {
	import flash.filesystem.File;
	
	public interface ILauncher {
		
		/**
		 * Calls into platform native code (binaries or scripts, depending on the current
		 * instance setup) with no predefined configuration. Used by all convenience 
		 * methods below.
		 * 
		 * @async
		 * 
		 * @param	runnable
		 * 			A file pointing to native code.
		 * 
		 * @param	config
		 * 			A configuration object.
		 */
		function raw (runnable : File, config : LauncherConfig) : void;
		
		/**
		 * Calls into platform native code (binaries or scripts, depending on the current instance setup);
		 * expects that the native code runs once, returns a predictible value, and exits. If the native code
		 * does not exit by itself, it will be forced to close after its first stdout message.
		 * 
		 * @async
		 * 
		 * @param	runnable
		 * 			A file pointing to native code.
		 * 
		 * @param	handler
		 * 			A handler object.
		 * 
		 * @param	args
		 * 			Optional. A list of arguments to send to the executable code at launch time.
		 * 
		 * @see ResultHandler
		 */
		function oneTimeWithConfirmation (runnable : File,
										  handler : ResultHandler,
										  args : Vector.<String> = null) : void;
		
		/**
		 * Calls into platform native code (binaries or scripts, depending on the current instance setup); 
		 * expects that the native code runs once and exits. No output is expected. If the native code does
		 * not exit by itself in a given timeframe, it will be forced to close.
		 * 
		 * @async
		 * 
		 * @param	runnable
		 * 			A file pointing to native code.
		 * 
		 * @param	handler
		 * 			A handler object.
		 * 
		 * @param	msecsTimeout
		 * 			Optional. The timeframe the runnable is expected to exit in. If it fails to do so, we
		 * 			should consider execution as failed, and force-close the runnable. Defaults to ten seconds.
		 * 
		 * @param	args
		 * 			Optional. A list of arguments to send to the executable code at launch time.
		 */
		function oneTimeWithTimeout (runnable : File, 
									 handler : ResultHandler,
									 msecsTimeout : Number = 10000, 
									 args : Vector.<String> = null) : void;
		
		/**
		 * Calls into platform native code (binaries or scripts, depending on the current instance setup);
		 * expects that the native code runs indefinitely. No output is expected.
		 * 
		 * @async
		 * 
		 * @param	runnable
		 * 			A file pointing to a native native code.
		 * 
		 * @param	handler
		 * 			A handler object.
		 * 
		 * @param	args
		 * 			Optional. A list of arguments to send to the executable code at launch time.
		 */
		function perpetual (runnable : File,
							handler : ResultHandler,
							args : Vector.<String> = null) : void;
		
		/**
		 * Calls into platform native code (binaries or scripts, depending on the current instance setup);
		 * expects that the native code runs indefinitely. Output is expected via stdout; an input stream
		 * is expected to be available on stdin.
		 * 
		 * @async
		 * 
		 * @param	runnable
		 * 			A file pointing to a native code.
		 * 
		 * @param	iHandler
		 * 			An interactive handler object.
		 * 
		 * @param	args
		 * 			Optional. A list of arguments to send to the executable code at launch time.
		 */
		function perpetualInteractive (runnable : File, 
									   iHandler : InteractiveResultHandler,
									   args : Vector.<String> = null) : void;
		
		/**
		 * Calls into platform native code (binaries or scripts, depending on the current instance setup);
		 * expects that the native code runs once and exits; no stdout shall be returned either. Instead,
		 * it is expected that the native code sends its output by calling back the current AIR application,
		 * with one or more arguments.
		 * 
		 * This is possible because attempting to launch an already running AIR application sends it an
		 * InvokeEvent rather than creating a new instance; received launch arguments are available on that
		 * event.
		 * 
		 * If the native code does not exit by itself, it will be forced to close after its first
		 * callback.
		 * 
		 * This scenario is usefull for native code that cannot write to stdout (nor accept stdin), but can
		 * launch other executable code while running.
		 * 
		 * @async
		 * 
		 * @param	runnable
		 * 			A file pointing to a native code.
		 * 
		 * @param	cbHandler
		 * 			A callback handler object.
		 * 
		 * @param	args
		 * 			Optional. A list of arguments to send to the executable code at launch time.
		 */
		function oneTimeWithCallBack (runnable : File, 
									  cbHandler : CallBackResultHandler,
									  args : Vector.<String> = null) : void;
		
	}
}