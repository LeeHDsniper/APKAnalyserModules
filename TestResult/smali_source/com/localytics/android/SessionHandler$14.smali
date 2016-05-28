.class Lcom/localytics/android/SessionHandler$14;
.super Ljava/lang/Object;
.source "SessionHandler.java"

# interfaces
.implements Ljava/lang/Runnable;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/localytics/android/SessionHandler;->handleMessage(Landroid/os/Message;)V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic this$0:Lcom/localytics/android/SessionHandler;

.field final synthetic val$intent:Landroid/content/Intent;


# direct methods
.method constructor <init>(Lcom/localytics/android/SessionHandler;Landroid/content/Intent;)V
    .registers 3

    .prologue
    .line 853
    iput-object p1, p0, Lcom/localytics/android/SessionHandler$14;->this$0:Lcom/localytics/android/SessionHandler;

    iput-object p2, p0, Lcom/localytics/android/SessionHandler$14;->val$intent:Landroid/content/Intent;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public run()V
    .registers 6

    .prologue
    const/4 v3, 0x0

    .line 857
    iget-object v1, p0, Lcom/localytics/android/SessionHandler$14;->val$intent:Landroid/content/Intent;

    const-string v2, "registration_id"

    invoke-virtual {v1, v2}, Landroid/content/Intent;->getStringExtra(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v0

    .line 859
    .local v0, "registrationId":Ljava/lang/String;
    iget-object v1, p0, Lcom/localytics/android/SessionHandler$14;->this$0:Lcom/localytics/android/SessionHandler;

    # invokes: Lcom/localytics/android/SessionHandler;->isPushDisabled()Z
    invoke-static {v1}, Lcom/localytics/android/SessionHandler;->access$000(Lcom/localytics/android/SessionHandler;)Z

    move-result v1

    if-eqz v1, :cond_22

    .line 861
    sget-boolean v1, Lcom/localytics/android/Constants;->IS_LOGGABLE:Z

    if-eqz v1, :cond_1c

    .line 863
    const-string v1, "Localytics"

    const-string v2, "GCM registered but push disabled: removing id"

    invoke-static {v1, v2}, Landroid/util/Log;->v(Ljava/lang/String;Ljava/lang/String;)I

    .line 866
    :cond_1c
    iget-object v1, p0, Lcom/localytics/android/SessionHandler$14;->this$0:Lcom/localytics/android/SessionHandler;

    invoke-virtual {v1, v3}, Lcom/localytics/android/SessionHandler;->setPushRegistrationId(Ljava/lang/String;)V

    .line 896
    :cond_21
    :goto_21
    return-void

    .line 869
    :cond_22
    iget-object v1, p0, Lcom/localytics/android/SessionHandler$14;->val$intent:Landroid/content/Intent;

    const-string v2, "error"

    invoke-virtual {v1, v2}, Landroid/content/Intent;->getStringExtra(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v1

    if-eqz v1, :cond_38

    .line 871
    sget-boolean v1, Lcom/localytics/android/Constants;->IS_LOGGABLE:Z

    if-eqz v1, :cond_21

    .line 873
    const-string v1, "Localytics"

    const-string v2, "GCM registration failed"

    invoke-static {v1, v2}, Landroid/util/Log;->v(Ljava/lang/String;Ljava/lang/String;)I

    goto :goto_21

    .line 877
    :cond_38
    iget-object v1, p0, Lcom/localytics/android/SessionHandler$14;->val$intent:Landroid/content/Intent;

    const-string v2, "unregistered"

    invoke-virtual {v1, v2}, Landroid/content/Intent;->getStringExtra(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v1

    if-eqz v1, :cond_53

    .line 879
    sget-boolean v1, Lcom/localytics/android/Constants;->IS_LOGGABLE:Z

    if-eqz v1, :cond_4d

    .line 881
    const-string v1, "Localytics"

    const-string v2, "GCM unregistered: removing id"

    invoke-static {v1, v2}, Landroid/util/Log;->v(Ljava/lang/String;Ljava/lang/String;)I

    .line 884
    :cond_4d
    iget-object v1, p0, Lcom/localytics/android/SessionHandler$14;->this$0:Lcom/localytics/android/SessionHandler;

    invoke-virtual {v1, v3}, Lcom/localytics/android/SessionHandler;->setPushRegistrationId(Ljava/lang/String;)V

    goto :goto_21

    .line 887
    :cond_53
    if-eqz v0, :cond_21

    .line 889
    sget-boolean v1, Lcom/localytics/android/Constants;->IS_LOGGABLE:Z

    if-eqz v1, :cond_6a

    .line 891
    const-string v1, "Localytics"

    const-string v2, "GCM registered, new id: %s"

    const/4 v3, 0x1

    new-array v3, v3, [Ljava/lang/Object;

    const/4 v4, 0x0

    aput-object v0, v3, v4

    invoke-static {v2, v3}, Ljava/lang/String;->format(Ljava/lang/String;[Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v2

    invoke-static {v1, v2}, Landroid/util/Log;->v(Ljava/lang/String;Ljava/lang/String;)I

    .line 894
    :cond_6a
    iget-object v1, p0, Lcom/localytics/android/SessionHandler$14;->this$0:Lcom/localytics/android/SessionHandler;

    invoke-virtual {v1, v0}, Lcom/localytics/android/SessionHandler;->setPushRegistrationId(Ljava/lang/String;)V

    goto :goto_21
.end method
