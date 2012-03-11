//
// Generated file, do not edit! Created by opp_msgc 4.2 from applications/scada/scadamessage.msg.
//

#ifndef _SCADAMESSAGE_M_H_
#define _SCADAMESSAGE_M_H_

#include <omnetpp.h>

// opp_msgc version check
#define MSGC_VERSION 0x0402
#if (MSGC_VERSION!=OMNETPP_VERSION)
#    error Version mismatch! Probably this file was generated by an earlier version of opp_msgc: 'make clean' should help.
#endif



/**
 * Class generated from <tt>applications/scada/scadamessage.msg</tt> by opp_msgc.
 * <pre>
 * packet scadamessage
 * {
 *     double timeToRespond; 
 *     bool last; 
 *     int packetNumber; 
 * }
 * </pre>
 */
class scadamessage : public ::cPacket
{
  protected:
    double timeToRespond_var;
    bool last_var;
    int packetNumber_var;

  private:
    void copy(const scadamessage& other);

  protected:
    // protected and unimplemented operator==(), to prevent accidental usage
    bool operator==(const scadamessage&);

  public:
    scadamessage(const char *name=NULL, int kind=0);
    scadamessage(const scadamessage& other);
    virtual ~scadamessage();
    scadamessage& operator=(const scadamessage& other);
    virtual scadamessage *dup() const {return new scadamessage(*this);}
    virtual void parsimPack(cCommBuffer *b);
    virtual void parsimUnpack(cCommBuffer *b);

    // field getter/setter methods
    virtual double getTimeToRespond() const;
    virtual void setTimeToRespond(double timeToRespond);
    virtual bool getLast() const;
    virtual void setLast(bool last);
    virtual int getPacketNumber() const;
    virtual void setPacketNumber(int packetNumber);
};

inline void doPacking(cCommBuffer *b, scadamessage& obj) {obj.parsimPack(b);}
inline void doUnpacking(cCommBuffer *b, scadamessage& obj) {obj.parsimUnpack(b);}


#endif // _SCADAMESSAGE_M_H_