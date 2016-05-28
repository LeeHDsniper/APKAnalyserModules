.class Lcom/adobe/creativesdk/foundation/internal/notification/AdobeLocalNotificationCenter$ObservableWrapper;
.super Ljava/util/Observable;
.source "AdobeLocalNotificationCenter.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/adobe/creativesdk/foundation/internal/notification/AdobeLocalNotificationCenter;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0xa
    name = "ObservableWrapper"
.end annotation


# direct methods
.method private constructor <init>()V
    .registers 1

    .prologue
    .line 24
    invoke-direct {p0}, Ljava/util/Observable;-><init>()V

    return-void
.end method

.method synthetic constructor <init>(Lcom/adobe/creativesdk/foundation/internal/notification/AdobeLocalNotificationCenter$1;)V
    .registers 2
    .param p1, "x0"    # Lcom/adobe/creativesdk/foundation/internal/notification/AdobeLocalNotificationCenter$1;

    .prologue
    .line 24
    invoke-direct {p0}, Lcom/adobe/creativesdk/foundation/internal/notification/AdobeLocalNotificationCenter$ObservableWrapper;-><init>()V

    return-void
.end method


# virtual methods
.method public markChanged()V
    .registers 1

    .prologue
    .line 28
    invoke-virtual {p0}, Lcom/adobe/creativesdk/foundation/internal/notification/AdobeLocalNotificationCenter$ObservableWrapper;->setChanged()V

    .line 29
    return-void
.end method
