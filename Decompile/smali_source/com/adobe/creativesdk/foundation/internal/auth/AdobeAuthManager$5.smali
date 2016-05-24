.class Lcom/adobe/creativesdk/foundation/internal/auth/AdobeAuthManager$5;
.super Ljava/lang/Object;
.source "AdobeAuthManager.java"

# interfaces
.implements Ljava/lang/Runnable;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/adobe/creativesdk/foundation/internal/auth/AdobeAuthManager;->handleEmergencyLogOut()V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic this$0:Lcom/adobe/creativesdk/foundation/internal/auth/AdobeAuthManager;


# direct methods
.method constructor <init>(Lcom/adobe/creativesdk/foundation/internal/auth/AdobeAuthManager;)V
    .registers 2
    .param p1, "this$0"    # Lcom/adobe/creativesdk/foundation/internal/auth/AdobeAuthManager;

    .prologue
    .line 752
    iput-object p1, p0, Lcom/adobe/creativesdk/foundation/internal/auth/AdobeAuthManager$5;->this$0:Lcom/adobe/creativesdk/foundation/internal/auth/AdobeAuthManager;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public run()V
    .registers 2

    .prologue
    .line 756
    iget-object v0, p0, Lcom/adobe/creativesdk/foundation/internal/auth/AdobeAuthManager$5;->this$0:Lcom/adobe/creativesdk/foundation/internal/auth/AdobeAuthManager;

    invoke-virtual {v0}, Lcom/adobe/creativesdk/foundation/internal/auth/AdobeAuthManager;->logout()V

    .line 757
    return-void
.end method
