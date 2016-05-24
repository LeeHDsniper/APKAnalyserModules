.class Lcom/adobe/creativesdk/aviary/widget/AdobeImageToolBar$ViewState;
.super Ljava/lang/Object;
.source "AdobeImageToolBar.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/adobe/creativesdk/aviary/widget/AdobeImageToolBar;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x8
    name = "ViewState"
.end annotation

.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lcom/adobe/creativesdk/aviary/widget/AdobeImageToolBar$ViewState$Status;
    }
.end annotation


# instance fields
.field current:Lcom/adobe/creativesdk/aviary/widget/AdobeImageToolBar$ViewState$Status;

.field previous:Lcom/adobe/creativesdk/aviary/widget/AdobeImageToolBar$ViewState$Status;


# direct methods
.method constructor <init>()V
    .registers 1

    .prologue
    .line 163
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 172
    return-void
.end method


# virtual methods
.method setCurrent(Lcom/adobe/creativesdk/aviary/widget/AdobeImageToolBar$ViewState$Status;)V
    .registers 3
    .param p1, "newState"    # Lcom/adobe/creativesdk/aviary/widget/AdobeImageToolBar$ViewState$Status;

    .prologue
    .line 168
    iget-object v0, p0, Lcom/adobe/creativesdk/aviary/widget/AdobeImageToolBar$ViewState;->current:Lcom/adobe/creativesdk/aviary/widget/AdobeImageToolBar$ViewState$Status;

    iput-object v0, p0, Lcom/adobe/creativesdk/aviary/widget/AdobeImageToolBar$ViewState;->previous:Lcom/adobe/creativesdk/aviary/widget/AdobeImageToolBar$ViewState$Status;

    .line 169
    iput-object p1, p0, Lcom/adobe/creativesdk/aviary/widget/AdobeImageToolBar$ViewState;->current:Lcom/adobe/creativesdk/aviary/widget/AdobeImageToolBar$ViewState$Status;

    .line 170
    return-void
.end method
