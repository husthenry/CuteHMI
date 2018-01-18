#ifndef CUTEHMI_CUTEHMI__AUTHSSH__1__LIB_INCLUDE_AUTHSSH_ABSTRACTCHANNEL_HPP
#define CUTEHMI_CUTEHMI__AUTHSSH__1__LIB_INCLUDE_AUTHSSH_ABSTRACTCHANNEL_HPP

#include "internal/common.hpp"
#include "Exception.hpp"

#include <QObject>
#include <QMap>

#include <libssh/libssh.h>

namespace cutehmi {
namespace authssh {

class CUTEHMI_AUTHSSH_API AbstractChannel:
	public QObject
{
	Q_OBJECT

	public:
		virtual ~AbstractChannel();

		bool isInitialized() const;

		bool init(ssh_session session);

		void shutdown();

	signals:
		void initialized();

		void activated();

		/**
		 * Channel closed. Indicates that channel has been closed. This signal is emitted after
		 * channel has been shut down by shutdown() function.
		 */
		void closed();

		void error(const QString & message);

	protected:
		AbstractChannel();

		virtual bool initChannel(ssh_channel channel) = 0;

		/**
		 * Process channel. This function is called whenever activated() signal is emitted.
		 * It is up to subclasses to emit activated() signal, when they find it appropriate.
		 * @param channel channel handle.
		 *
		 * @warning implementation must be non-blocking, because all channels are processed in
		 * a collective thread.
		 */
		virtual bool processChannel(ssh_channel channel) = 0;

		virtual void shutdownChannel(ssh_channel channel) = 0;

	private slots:
		void process();

	private:
		void freeChannel();

		struct Members
		{
			ssh_channel channel;
		};

		utils::MPtr<Members> m;
};

}
}

#endif // CHANNEL_HPP
