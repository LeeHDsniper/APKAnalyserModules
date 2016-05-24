.class public Lcom/adobe/creativesdk/aviary/internal/events/MessageUserActionEvent;
.super Ljava/lang/Object;
.source "MessageUserActionEvent.java"


# instance fields
.field public final action:I

.field public final extras:Landroid/os/Bundle;

.field public final messageContentId:J

.field public final messageId:J

.field private final packIdentifier:Ljava/lang/String;


# direct methods
.method public constructor <init>(ILandroid/os/Bundle;JJLjava/lang/String;)V
    .registers 9
    .param p1, "action"    # I
    .param p2, "extras"    # Landroid/os/Bundle;
    .param p3, "messageId"    # J
    .param p5, "messageContentId"    # J
    .param p7, "packIdentifier"    # Ljava/lang/String;

    .prologue
    .line 18
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 20
    iput p1, p0, Lcom/adobe/creativesdk/aviary/internal/events/MessageUserActionEvent;->action:I

    .line 21
    iput-wide p3, p0, Lcom/adobe/creativesdk/aviary/internal/events/MessageUserActionEvent;->messageId:J

    .line 22
    iput-wide p5, p0, Lcom/adobe/creativesdk/aviary/internal/events/MessageUserActionEvent;->messageContentId:J

    .line 23
    iput-object p7, p0, Lcom/adobe/creativesdk/aviary/internal/events/MessageUserActionEvent;->packIdentifier:Ljava/lang/String;

    .line 24
    iput-object p2, p0, Lcom/adobe/creativesdk/aviary/internal/events/MessageUserActionEvent;->extras:Landroid/os/Bundle;

    .line 25
    return-void
.end method
