#------------------------------------------------------------------------------
#
#  WARNING !
#
#  This is a generated file. DO NOT EDIT THIS FILE! Your changes will
#  be lost the next time this file is regenerated.
#
#  This file was generated using asterisk-ari-client ruby gem.
#
#------------------------------------------------------------------------------

module Ari
  class Channel < Resource

    attr_reader :id, :name, :state, :caller, :connected, :accountcode, :dialplan, :creationtime, :language, :channelvars

    def caller=(val)
      @caller ||= CallerID.new(val)
    end

    def connected=(val)
      @connected ||= CallerID.new(val)
    end

    def dialplan=(val)
      @dialplan ||= DialplanCEP.new(val)
    end

    def creationtime=(val)
      @creationtime ||= Time.parse(val)
    end

    def channelvars=(val)
      @channelvars ||= object.new(val)
    end


    # GET /channels
    #
    # Active channels
    #
    #
    def self.list(options = {})
      path = '/channels'
      response = client(options).get(path, options)
      response.map { |hash| Channel.new(hash.merge(client: options[:client])) }
    end

    # POST /channels
    #
    # Active channels
    #
    #
    # Parameters:
    #
    # endpoint (required) - Endpoint to call.
    # extension  - The extension to dial after the endpoint answers. Mutually exclusive with 'app'.
    # context  - The context to dial after the endpoint answers. If omitted, uses 'default'. Mutually exclusive with 'app'.
    # priority  - The priority to dial after the endpoint answers. If omitted, uses 1. Mutually exclusive with 'app'.
    # label  - The label to dial after the endpoint answers. Will supersede 'priority' if provided. Mutually exclusive with 'app'.
    # app  - The application that is subscribed to the originated channel. When the channel is answered, it will be passed to this Stasis application. Mutually exclusive with 'context', 'extension', 'priority', and 'label'.
    # appArgs  - The application arguments to pass to the Stasis application provided by 'app'. Mutually exclusive with 'context', 'extension', 'priority', and 'label'.
    # callerId  - CallerID to use when dialing the endpoint or extension.
    # timeout  - Timeout (in seconds) before giving up dialing, or -1 for no timeout.
    # variables  - The "variables" key in the body object holds variable key/value pairs to set on the channel on creation. Other keys in the body object are interpreted as query parameters. Ex. { "endpoint": "SIP/Alice", "variables": { "CALLERID(name)": "Alice" } }
    # channelId  - The unique id to assign the channel on creation.
    # otherChannelId  - The unique id to assign the second channel when using local channels.
    # originator  - The unique id of the channel which is originating this one.
    # formats  - The format name capability list to use if originator is not specified. Ex. "ulaw,slin16".  Format names can be found with "core show codecs".
    #
    def self.originate(options = {})
      raise ArgumentError.new("Parameter endpoint must be passed in options hash.") unless options[:endpoint]
      path = '/channels'
      response = client(options).post(path, options)
      Channel.new(response.merge(client: options[:client]))
    end

    # POST /channels/create
    #
    # Create a channel and place it in a Stasis app, but do not dial the channel yet.
    #
    #
    # Parameters:
    #
    # endpoint (required) - Endpoint for channel communication
    # app (required) - Stasis Application to place channel into
    # appArgs  - The application arguments to pass to the Stasis application provided by 'app'. Mutually exclusive with 'context', 'extension', 'priority', and 'label'.
    # channelId  - The unique id to assign the channel on creation.
    # otherChannelId  - The unique id to assign the second channel when using local channels.
    # originator  - Unique ID of the calling channel
    # formats  - The format name capability list to use if originator is not specified. Ex. "ulaw,slin16".  Format names can be found with "core show codecs".
    #
    def self.create(options = {})
      raise ArgumentError.new("Parameter endpoint must be passed in options hash.") unless options[:endpoint]
      raise ArgumentError.new("Parameter app must be passed in options hash.") unless options[:app]
      path = '/channels/create'
      response = client(options).post(path, options)
      Channel.new(response.merge(client: options[:client]))
    end

    # GET /channels/%{channelId}
    #
    # Active channel
    #
    #
    # Parameters:
    #
    # channelId (required) - Channel's id
    #
    def self.get(options = {})
      raise ArgumentError.new("Parameter channelId must be passed in options hash.") unless options[:channelId]
      path = '/channels/%{channelId}' % options
      response = client(options).get(path, options)
      Channel.new(response.merge(client: options[:client]))
    end

    def get(options = {})
      self.class.get(options.merge(channelId: self.id, client: @client))
    end

    # POST /channels/%{channelId}
    #
    # Active channel
    #
    #
    # Parameters:
    #
    # channelId (required) - The unique id to assign the channel on creation.
    # endpoint (required) - Endpoint to call.
    # extension  - The extension to dial after the endpoint answers. Mutually exclusive with 'app'.
    # context  - The context to dial after the endpoint answers. If omitted, uses 'default'. Mutually exclusive with 'app'.
    # priority  - The priority to dial after the endpoint answers. If omitted, uses 1. Mutually exclusive with 'app'.
    # label  - The label to dial after the endpoint answers. Will supersede 'priority' if provided. Mutually exclusive with 'app'.
    # app  - The application that is subscribed to the originated channel. When the channel is answered, it will be passed to this Stasis application. Mutually exclusive with 'context', 'extension', 'priority', and 'label'.
    # appArgs  - The application arguments to pass to the Stasis application provided by 'app'. Mutually exclusive with 'context', 'extension', 'priority', and 'label'.
    # callerId  - CallerID to use when dialing the endpoint or extension.
    # timeout  - Timeout (in seconds) before giving up dialing, or -1 for no timeout.
    # variables  - The "variables" key in the body object holds variable key/value pairs to set on the channel on creation. Other keys in the body object are interpreted as query parameters. Ex. { "endpoint": "SIP/Alice", "variables": { "CALLERID(name)": "Alice" } }
    # otherChannelId  - The unique id to assign the second channel when using local channels.
    # originator  - The unique id of the channel which is originating this one.
    # formats  - The format name capability list to use if originator is not specified. Ex. "ulaw,slin16".  Format names can be found with "core show codecs".
    #
    def self.originate_with_id(options = {})
      raise ArgumentError.new("Parameter channelId must be passed in options hash.") unless options[:channelId]
      raise ArgumentError.new("Parameter endpoint must be passed in options hash.") unless options[:endpoint]
      path = '/channels/%{channelId}' % options
      response = client(options).post(path, options)
      Channel.new(response.merge(client: options[:client]))
    end
    class << self; alias_method :originateWithId, :originate_with_id; end

    def originate_with_id(options = {})
      self.class.originate_with_id(options.merge(channelId: self.id, client: @client))
    end

    # DELETE /channels/%{channelId}
    #
    # Active channel
    #
    #
    # Parameters:
    #
    # channelId (required) - Channel's id
    # reason  - Reason for hanging up the channel
    #
    def self.hangup(options = {})
      raise ArgumentError.new("Parameter channelId must be passed in options hash.") unless options[:channelId]
      path = '/channels/%{channelId}' % options
      response = client(options).delete(path, options)
    rescue Ari::RequestError => e
      raise unless e.code == '404'
    end

    def hangup(options = {})
      self.class.hangup(options.merge(channelId: self.id, client: @client))
    end

    # POST /channels/%{channelId}/continue
    #
    # Exit application; continue execution in the dialplan
    #
    #
    # Parameters:
    #
    # channelId (required) - Channel's id
    # context  - The context to continue to.
    # extension  - The extension to continue to.
    # priority  - The priority to continue to.
    # label  - The label to continue to - will supersede 'priority' if both are provided.
    #
    def self.continue_in_dialplan(options = {})
      raise ArgumentError.new("Parameter channelId must be passed in options hash.") unless options[:channelId]
      path = '/channels/%{channelId}/continue' % options
      response = client(options).post(path, options)
    end
    class << self; alias_method :continueInDialplan, :continue_in_dialplan; end

    def continue_in_dialplan(options = {})
      self.class.continue_in_dialplan(options.merge(channelId: self.id, client: @client))
    end

    # POST /channels/%{channelId}/move
    #
    # Move the channel from one Stasis application to another.
    #
    #
    # Parameters:
    #
    # channelId (required) - Channel's id
    # app (required) - The channel will be passed to this Stasis application.
    # appArgs  - The application arguments to pass to the Stasis application provided by 'app'.
    #
    def self.move(options = {})
      raise ArgumentError.new("Parameter channelId must be passed in options hash.") unless options[:channelId]
      raise ArgumentError.new("Parameter app must be passed in options hash.") unless options[:app]
      path = '/channels/%{channelId}/move' % options
      response = client(options).post(path, options)
    end

    def move(options = {})
      self.class.move(options.merge(channelId: self.id, client: @client))
    end

    # POST /channels/%{channelId}/redirect
    #
    # Inform the channel that it should redirect itself to a different location. Note that this will almost certainly cause the channel to exit the application.
    #
    #
    # Parameters:
    #
    # channelId (required) - Channel's id
    # endpoint (required) - The endpoint to redirect the channel to
    #
    def self.redirect(options = {})
      raise ArgumentError.new("Parameter channelId must be passed in options hash.") unless options[:channelId]
      raise ArgumentError.new("Parameter endpoint must be passed in options hash.") unless options[:endpoint]
      path = '/channels/%{channelId}/redirect' % options
      response = client(options).post(path, options)
    end

    def redirect(options = {})
      self.class.redirect(options.merge(channelId: self.id, client: @client))
    end

    # POST /channels/%{channelId}/answer
    #
    # Answer a channel
    #
    #
    # Parameters:
    #
    # channelId (required) - Channel's id
    #
    def self.answer(options = {})
      raise ArgumentError.new("Parameter channelId must be passed in options hash.") unless options[:channelId]
      path = '/channels/%{channelId}/answer' % options
      response = client(options).post(path, options)
    end

    def answer(options = {})
      self.class.answer(options.merge(channelId: self.id, client: @client))
    end

    # POST /channels/%{channelId}/ring
    #
    # Send a ringing indication to a channel
    #
    #
    # Parameters:
    #
    # channelId (required) - Channel's id
    #
    def self.ring(options = {})
      raise ArgumentError.new("Parameter channelId must be passed in options hash.") unless options[:channelId]
      path = '/channels/%{channelId}/ring' % options
      response = client(options).post(path, options)
    end

    def ring(options = {})
      self.class.ring(options.merge(channelId: self.id, client: @client))
    end

    # DELETE /channels/%{channelId}/ring
    #
    # Send a ringing indication to a channel
    #
    #
    # Parameters:
    #
    # channelId (required) - Channel's id
    #
    def self.ring_stop(options = {})
      raise ArgumentError.new("Parameter channelId must be passed in options hash.") unless options[:channelId]
      path = '/channels/%{channelId}/ring' % options
      response = client(options).delete(path, options)
    rescue Ari::RequestError => e
      raise unless e.code == '404'
    end
    class << self; alias_method :ringStop, :ring_stop; end

    def ring_stop(options = {})
      self.class.ring_stop(options.merge(channelId: self.id, client: @client))
    end

    # POST /channels/%{channelId}/dtmf
    #
    # Send DTMF to a channel
    #
    #
    # Parameters:
    #
    # channelId (required) - Channel's id
    # dtmf  - DTMF To send.
    # before  - Amount of time to wait before DTMF digits (specified in milliseconds) start.
    # between  - Amount of time in between DTMF digits (specified in milliseconds).
    # duration  - Length of each DTMF digit (specified in milliseconds).
    # after  - Amount of time to wait after DTMF digits (specified in milliseconds) end.
    #
    def self.send_dtmf(options = {})
      raise ArgumentError.new("Parameter channelId must be passed in options hash.") unless options[:channelId]
      path = '/channels/%{channelId}/dtmf' % options
      response = client(options).post(path, options)
    end
    class << self; alias_method :sendDTMF, :send_dtmf; end

    def send_dtmf(options = {})
      self.class.send_dtmf(options.merge(channelId: self.id, client: @client))
    end

    # POST /channels/%{channelId}/mute
    #
    # Mute a channel
    #
    #
    # Parameters:
    #
    # channelId (required) - Channel's id
    # direction  - Direction in which to mute audio
    #
    def self.mute(options = {})
      raise ArgumentError.new("Parameter channelId must be passed in options hash.") unless options[:channelId]
      path = '/channels/%{channelId}/mute' % options
      response = client(options).post(path, options)
    end

    def mute(options = {})
      self.class.mute(options.merge(channelId: self.id, client: @client))
    end

    # DELETE /channels/%{channelId}/mute
    #
    # Mute a channel
    #
    #
    # Parameters:
    #
    # channelId (required) - Channel's id
    # direction  - Direction in which to unmute audio
    #
    def self.unmute(options = {})
      raise ArgumentError.new("Parameter channelId must be passed in options hash.") unless options[:channelId]
      path = '/channels/%{channelId}/mute' % options
      response = client(options).delete(path, options)
    rescue Ari::RequestError => e
      raise unless e.code == '404'
    end

    def unmute(options = {})
      self.class.unmute(options.merge(channelId: self.id, client: @client))
    end

    # POST /channels/%{channelId}/hold
    #
    # Put a channel on hold
    #
    #
    # Parameters:
    #
    # channelId (required) - Channel's id
    #
    def self.hold(options = {})
      raise ArgumentError.new("Parameter channelId must be passed in options hash.") unless options[:channelId]
      path = '/channels/%{channelId}/hold' % options
      response = client(options).post(path, options)
    end

    def hold(options = {})
      self.class.hold(options.merge(channelId: self.id, client: @client))
    end

    # DELETE /channels/%{channelId}/hold
    #
    # Put a channel on hold
    #
    #
    # Parameters:
    #
    # channelId (required) - Channel's id
    #
    def self.unhold(options = {})
      raise ArgumentError.new("Parameter channelId must be passed in options hash.") unless options[:channelId]
      path = '/channels/%{channelId}/hold' % options
      response = client(options).delete(path, options)
    rescue Ari::RequestError => e
      raise unless e.code == '404'
    end

    def unhold(options = {})
      self.class.unhold(options.merge(channelId: self.id, client: @client))
    end

    # POST /channels/%{channelId}/moh
    #
    # Play music on hold to a channel
    #
    #
    # Parameters:
    #
    # channelId (required) - Channel's id
    # mohClass  - Music on hold class to use
    #
    def self.start_moh(options = {})
      raise ArgumentError.new("Parameter channelId must be passed in options hash.") unless options[:channelId]
      path = '/channels/%{channelId}/moh' % options
      response = client(options).post(path, options)
    end
    class << self; alias_method :startMoh, :start_moh; end

    def start_moh(options = {})
      self.class.start_moh(options.merge(channelId: self.id, client: @client))
    end

    # DELETE /channels/%{channelId}/moh
    #
    # Play music on hold to a channel
    #
    #
    # Parameters:
    #
    # channelId (required) - Channel's id
    #
    def self.stop_moh(options = {})
      raise ArgumentError.new("Parameter channelId must be passed in options hash.") unless options[:channelId]
      path = '/channels/%{channelId}/moh' % options
      response = client(options).delete(path, options)
    rescue Ari::RequestError => e
      raise unless e.code == '404'
    end
    class << self; alias_method :stopMoh, :stop_moh; end

    def stop_moh(options = {})
      self.class.stop_moh(options.merge(channelId: self.id, client: @client))
    end

    # POST /channels/%{channelId}/silence
    #
    # Play silence to a channel
    #
    #
    # Parameters:
    #
    # channelId (required) - Channel's id
    #
    def self.start_silence(options = {})
      raise ArgumentError.new("Parameter channelId must be passed in options hash.") unless options[:channelId]
      path = '/channels/%{channelId}/silence' % options
      response = client(options).post(path, options)
    end
    class << self; alias_method :startSilence, :start_silence; end

    def start_silence(options = {})
      self.class.start_silence(options.merge(channelId: self.id, client: @client))
    end

    # DELETE /channels/%{channelId}/silence
    #
    # Play silence to a channel
    #
    #
    # Parameters:
    #
    # channelId (required) - Channel's id
    #
    def self.stop_silence(options = {})
      raise ArgumentError.new("Parameter channelId must be passed in options hash.") unless options[:channelId]
      path = '/channels/%{channelId}/silence' % options
      response = client(options).delete(path, options)
    rescue Ari::RequestError => e
      raise unless e.code == '404'
    end
    class << self; alias_method :stopSilence, :stop_silence; end

    def stop_silence(options = {})
      self.class.stop_silence(options.merge(channelId: self.id, client: @client))
    end

    # POST /channels/%{channelId}/play
    #
    # Play media to a channel
    #
    #
    # Parameters:
    #
    # channelId (required) - Channel's id
    # media (required) - Media URIs to play.
    # lang  - For sounds, selects language for sound.
    # offsetms  - Number of milliseconds to skip before playing. Only applies to the first URI if multiple media URIs are specified.
    # skipms  - Number of milliseconds to skip for forward/reverse operations.
    # playbackId  - Playback ID.
    #
    def self.play(options = {})
      raise ArgumentError.new("Parameter channelId must be passed in options hash.") unless options[:channelId]
      raise ArgumentError.new("Parameter media must be passed in options hash.") unless options[:media]
      path = '/channels/%{channelId}/play' % options
      response = client(options).post(path, options)
      Playback.new(response.merge(client: options[:client]))
    end

    def play(options = {})
      self.class.play(options.merge(channelId: self.id, client: @client))
    end

    # POST /channels/%{channelId}/play/%{playbackId}
    #
    # Play media to a channel
    #
    #
    # Parameters:
    #
    # channelId (required) - Channel's id
    # playbackId (required) - Playback ID.
    # media (required) - Media URIs to play.
    # lang  - For sounds, selects language for sound.
    # offsetms  - Number of milliseconds to skip before playing. Only applies to the first URI if multiple media URIs are specified.
    # skipms  - Number of milliseconds to skip for forward/reverse operations.
    #
    def self.play_with_id(options = {})
      raise ArgumentError.new("Parameter channelId must be passed in options hash.") unless options[:channelId]
      raise ArgumentError.new("Parameter playbackId must be passed in options hash.") unless options[:playbackId]
      raise ArgumentError.new("Parameter media must be passed in options hash.") unless options[:media]
      path = '/channels/%{channelId}/play/%{playbackId}' % options
      response = client(options).post(path, options)
      Playback.new(response.merge(client: options[:client]))
    end
    class << self; alias_method :playWithId, :play_with_id; end

    def play_with_id(options = {})
      self.class.play_with_id(options.merge(channelId: self.id, client: @client))
    end

    # POST /channels/%{channelId}/record
    #
    # Record audio from a channel
    #
    #
    # Parameters:
    #
    # channelId (required) - Channel's id
    # name (required) - Recording's filename
    # format (required) - Format to encode audio in
    # maxDurationSeconds  - Maximum duration of the recording, in seconds. 0 for no limit
    # maxSilenceSeconds  - Maximum duration of silence, in seconds. 0 for no limit
    # ifExists  - Action to take if a recording with the same name already exists.
    # beep  - Play beep when recording begins
    # terminateOn  - DTMF input to terminate recording
    #
    def self.record(options = {})
      raise ArgumentError.new("Parameter channelId must be passed in options hash.") unless options[:channelId]
      raise ArgumentError.new("Parameter name must be passed in options hash.") unless options[:name]
      raise ArgumentError.new("Parameter format must be passed in options hash.") unless options[:format]
      path = '/channels/%{channelId}/record' % options
      response = client(options).post(path, options)
      LiveRecording.new(response.merge(client: options[:client]))
    end

    def record(options = {})
      self.class.record(options.merge(channelId: self.id, client: @client))
    end

    # GET /channels/%{channelId}/variable
    #
    # Variables on a channel
    #
    #
    # Parameters:
    #
    # channelId (required) - Channel's id
    # variable (required) - The channel variable or function to get
    #
    def self.get_channel_var(options = {})
      raise ArgumentError.new("Parameter channelId must be passed in options hash.") unless options[:channelId]
      raise ArgumentError.new("Parameter variable must be passed in options hash.") unless options[:variable]
      path = '/channels/%{channelId}/variable' % options
      response = client(options).get(path, options)
      Variable.new(response.merge(client: options[:client]))
    end
    class << self; alias_method :getChannelVar, :get_channel_var; end

    def get_channel_var(options = {})
      self.class.get_channel_var(options.merge(channelId: self.id, client: @client))
    end

    # POST /channels/%{channelId}/variable
    #
    # Variables on a channel
    #
    #
    # Parameters:
    #
    # channelId (required) - Channel's id
    # variable (required) - The channel variable or function to set
    # value  - The value to set the variable to
    #
    def self.set_channel_var(options = {})
      raise ArgumentError.new("Parameter channelId must be passed in options hash.") unless options[:channelId]
      raise ArgumentError.new("Parameter variable must be passed in options hash.") unless options[:variable]
      path = '/channels/%{channelId}/variable' % options
      response = client(options).post(path, options)
    end
    class << self; alias_method :setChannelVar, :set_channel_var; end

    def set_channel_var(options = {})
      self.class.set_channel_var(options.merge(channelId: self.id, client: @client))
    end

    # POST /channels/%{channelId}/snoop
    #
    # Snoop (spy/whisper) on a channel
    #
    #
    # Parameters:
    #
    # channelId (required) - Channel's id
    # spy  - Direction of audio to spy on
    # whisper  - Direction of audio to whisper into
    # app (required) - Application the snooping channel is placed into
    # appArgs  - The application arguments to pass to the Stasis application
    # snoopId  - Unique ID to assign to snooping channel
    #
    def self.snoop_channel(options = {})
      raise ArgumentError.new("Parameter channelId must be passed in options hash.") unless options[:channelId]
      raise ArgumentError.new("Parameter app must be passed in options hash.") unless options[:app]
      path = '/channels/%{channelId}/snoop' % options
      response = client(options).post(path, options)
      Channel.new(response.merge(client: options[:client]))
    end
    class << self; alias_method :snoopChannel, :snoop_channel; end

    def snoop_channel(options = {})
      self.class.snoop_channel(options.merge(channelId: self.id, client: @client))
    end

    # POST /channels/%{channelId}/snoop/%{snoopId}
    #
    # Snoop (spy/whisper) on a channel
    #
    #
    # Parameters:
    #
    # channelId (required) - Channel's id
    # snoopId (required) - Unique ID to assign to snooping channel
    # spy  - Direction of audio to spy on
    # whisper  - Direction of audio to whisper into
    # app (required) - Application the snooping channel is placed into
    # appArgs  - The application arguments to pass to the Stasis application
    #
    def self.snoop_channel_with_id(options = {})
      raise ArgumentError.new("Parameter channelId must be passed in options hash.") unless options[:channelId]
      raise ArgumentError.new("Parameter snoopId must be passed in options hash.") unless options[:snoopId]
      raise ArgumentError.new("Parameter app must be passed in options hash.") unless options[:app]
      path = '/channels/%{channelId}/snoop/%{snoopId}' % options
      response = client(options).post(path, options)
      Channel.new(response.merge(client: options[:client]))
    end
    class << self; alias_method :snoopChannelWithId, :snoop_channel_with_id; end

    def snoop_channel_with_id(options = {})
      self.class.snoop_channel_with_id(options.merge(channelId: self.id, client: @client))
    end

    # POST /channels/%{channelId}/dial
    #
    # Dial a channel
    #
    #
    # Parameters:
    #
    # channelId (required) - Channel's id
    # caller  - Channel ID of caller
    # timeout  - Dial timeout
    #
    def self.dial(options = {})
      raise ArgumentError.new("Parameter channelId must be passed in options hash.") unless options[:channelId]
      path = '/channels/%{channelId}/dial' % options
      response = client(options).post(path, options)
    end

    def dial(options = {})
      self.class.dial(options.merge(channelId: self.id, client: @client))
    end

    # GET /channels/%{channelId}/rtp_statistics
    #
    # Get RTP statistics information for RTP on a channel
    #
    #
    # Parameters:
    #
    # channelId (required) - Channel's id
    #
    def self.rtpstatistics(options = {})
      raise ArgumentError.new("Parameter channelId must be passed in options hash.") unless options[:channelId]
      path = '/channels/%{channelId}/rtp_statistics' % options
      response = client(options).get(path, options)
      RTPstat.new(response.merge(client: options[:client]))
    end

    def rtpstatistics(options = {})
      self.class.rtpstatistics(options.merge(channelId: self.id, client: @client))
    end


  end
end

Ari::Client.send :define_method, 'channels' do
  Ari::ListResource.new(self, Ari::Channel)
end
