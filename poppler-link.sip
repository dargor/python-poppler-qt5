namespace Poppler {

class Link {
%TypeHeaderCode
#include <qt5/poppler-qt5.h>
#include <qt5/poppler-link.h>
%End

public:
    Link( const QRectF &linkArea );
    enum LinkType
    {
        None,
        Goto,
        Execute,
        Browse,
        Action,
        Sound,
        Movie,
        Rendition,
        JavaScript,
%If(POPPLER_V0_50_0 -)
        OCGState,
%End
    };
    virtual LinkType linkType() const;
    virtual ~Link();
    QRectF linkArea() const;

private:
    Link(const Poppler::Link&);
    
%ConvertToSubClassCode
    switch (sipCpp->linkType()) {
        case Poppler::Link::Goto:
            sipType = sipType_Poppler_LinkGoto;
            break;
        case Poppler::Link::Execute:
            sipType = sipType_Poppler_LinkExecute;
            break;
        case Poppler::Link::Browse:
            sipType = sipType_Poppler_LinkBrowse;
            break;
        case Poppler::Link::Action:
            sipType = sipType_Poppler_LinkAction;
            break;
        case Poppler::Link::Sound:
            sipType = sipType_Poppler_LinkSound;
            break;
        case Poppler::Link::Movie:
            sipType = sipType_Poppler_LinkMovie;
             break;
        case Poppler::Link::Rendition:
            sipType = sipType_Poppler_LinkRendition;
            break;
        case Poppler::Link::JavaScript:
            sipType = sipType_Poppler_LinkJavaScript;
            break;
        default:
            sipType = sipType_Poppler_Link;
    }
%End

}; // class Link


class LinkGoto : Poppler::Link {
%TypeHeaderCode
#include <qt5/poppler-qt5.h>
#include <qt5/poppler-link.h>
%End

public:
    LinkGoto( const QRectF &linkArea, QString extFileName, const Poppler::LinkDestination & destination );
    ~LinkGoto();
    bool isExternal() const;
    QString fileName() const;
    Poppler::LinkDestination destination() const;
    LinkType linkType() const;

private:
    LinkGoto(const Poppler::LinkGoto&);
    
}; // class LinkGoto


class LinkExecute : Poppler::Link {
%TypeHeaderCode
#include <qt5/poppler-qt5.h>
#include <qt5/poppler-link.h>
%End

public:
    QString fileName() const;
    QString parameters() const;
    LinkExecute( const QRectF &linkArea, const QString & file, const QString & params );
    ~LinkExecute();
    LinkType linkType() const;

private:
    LinkExecute(const Poppler::LinkExecute&);
    
}; // class LinkExecute


class LinkBrowse : Poppler::Link {
%TypeHeaderCode
#include <qt5/poppler-qt5.h>
#include <qt5/poppler-link.h>
%End

public:
    QString url() const;
    LinkBrowse( const QRectF &linkArea, const QString &url );
    ~LinkBrowse();
    LinkType linkType() const;

private:
    LinkBrowse(const Poppler::LinkBrowse&);
    
}; // class LinkBrowse


class LinkAction : Poppler::Link {
%TypeHeaderCode
#include <qt5/poppler-qt5.h>
#include <qt5/poppler-link.h>
%End

public:
    enum ActionType {
        PageFirst = 1,
        PagePrev = 2,
        PageNext = 3,
        PageLast = 4,
        HistoryBack = 5,
        HistoryForward = 6,
        Quit = 7,
        Presentation = 8,
        EndPresentation = 9,
        Find = 10,
        GoToPage = 11,
        Close = 12,
        Print = 13,
    };
    ActionType actionType() const;
    LinkAction( const QRectF &linkArea, ActionType actionType );
    ~LinkAction();
    LinkType linkType() const;

private:
    LinkAction(const Poppler::LinkAction&);
    
}; // class LinkAction


class LinkSound : Poppler::Link {
%TypeHeaderCode
#include <qt5/poppler-qt5.h>
#include <qt5/poppler-link.h>
%End

public:
    LinkSound( const QRectF &linkArea, double volume, bool sync, bool repeat, bool mix, Poppler::SoundObject *sound );
    virtual ~LinkSound();
    LinkType linkType() const;
    double volume() const;
    bool synchronous() const;
    bool repeat() const;
    bool mix() const;
    Poppler::SoundObject *sound() const;

private:
    LinkSound(const Poppler::LinkSound&);
    
}; // class LinkSound

%If(POPPLER_V0_22_0 -)
class LinkRendition : Poppler::Link
{
%TypeHeaderCode
#include <qt5/poppler-qt5.h>
#include <qt5/poppler-link.h>
%End

	public:
		enum RenditionAction
        {
			NoRendition,
			PlayRendition,
			StopRendition,
			PauseRendition,
			ResumeRendition
		};
		//LinkRendition( const QRectF &linkArea, Poppler::MediaRendition *rendition, int operation, const QString &script, const Ref &annotationReference );
		virtual ~LinkRendition();
		LinkType linkType() const;
		MediaRendition *rendition() const;
		RenditionAction action() const;
		QString script() const;
		bool isReferencedAnnotation( const Poppler::ScreenAnnotation *annotation ) const;
    private:
        LinkRendition(const Poppler::LinkRendition&);

}; // class LinkRendition
%End


class LinkJavaScript : Poppler::Link {
%TypeHeaderCode
#include <qt5/poppler-qt5.h>
#include <qt5/poppler-link.h>
%End

public:
    LinkJavaScript( const QRectF &linkArea, const QString &js );
    virtual ~LinkJavaScript();
    LinkType linkType() const;
    QString script() const;

private:
    LinkJavaScript(const Poppler::LinkJavaScript&);
    
}; // class LinkJavaScript

class LinkMovie : Poppler::Link
{
%Docstring
Movie: a movie to be played.
%End
%TypeHeaderCode
#include <qt5/poppler-qt5.h>
#include <qt5/poppler-link.h>
%End
	public:
		/**
		 * Describes the operation to be performed on the movie.
		 */
		enum Operation
        {
            Play,
            Stop,
		    Pause,
		    Resume
		};

		/**
		 * Create a new Movie link.
		 *
		 * \param linkArea the active area of the link
		 * \param operation the operation to be performed on the movie
		 * \param annotationTitle the title of the movie annotation identifying the movie to be played
		 * \param annotationReference the object reference of the movie annotation identifying the movie to be played
		 *
		 * Note: This constructor is supposed to be used by Poppler::Page only.
		 */
		//LinkMovie( const QRectF &linkArea, Operation operation, const QString &annotationTitle, const Ref &annotationReference );
		/**
		 * Destructor.
		 */
		~LinkMovie();
		LinkType linkType() const;
		/**
		 * Returns the operation to be performed on the movie.
		 */
		Operation operation() const;
		/**
		 * Returns whether the given @p annotation is the referenced movie annotation for this movie @p link.
		 */
		bool isReferencedAnnotation( const Poppler::MovieAnnotation *annotation ) const;
    private:
        LinkMovie(const Poppler::LinkMovie&);

}; // class LinkMovie

%If(POPPLER_V0_50_0 -)
class LinkOCGState : Poppler::Link
{
		LinkType linkType() const;
    private:
        LinkOCGState(const Poppler::LinkOCGState&);
}; // class LinkOCGState
%End

}; // namespace Poppler

/* kate: indent-width 4; space-indent on; hl c++; indent-mode cstyle; */
