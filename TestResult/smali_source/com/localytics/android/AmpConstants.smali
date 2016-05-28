.class Lcom/localytics/android/AmpConstants;
.super Lcom/localytics/android/Constants;
.source "AmpConstants.java"


# static fields
.field private static final sTestModeEnabled:Ljava/util/concurrent/atomic/AtomicBoolean;


# direct methods
.method static constructor <clinit>()V
    .registers 2

    .prologue
    .line 15
    new-instance v0, Ljava/util/concurrent/atomic/AtomicBoolean;

    const/4 v1, 0x0

    invoke-direct {v0, v1}, Ljava/util/concurrent/atomic/AtomicBoolean;-><init>(Z)V

    sput-object v0, Lcom/localytics/android/AmpConstants;->sTestModeEnabled:Ljava/util/concurrent/atomic/AtomicBoolean;

    return-void
.end method

.method public static isTestModeEnabled()Z
    .registers 1

    .prologue
    .line 24
    sget-object v0, Lcom/localytics/android/AmpConstants;->sTestModeEnabled:Ljava/util/concurrent/atomic/AtomicBoolean;

    invoke-virtual {v0}, Ljava/util/concurrent/atomic/AtomicBoolean;->get()Z

    move-result v0

    return v0
.end method

.method public static setTestModeEnabled(Z)V
    .registers 2
    .param p0, "enabled"    # Z

    .prologue
    .line 19
    sget-object v0, Lcom/localytics/android/AmpConstants;->sTestModeEnabled:Ljava/util/concurrent/atomic/AtomicBoolean;

    invoke-virtual {v0, p0}, Ljava/util/concurrent/atomic/AtomicBoolean;->set(Z)V

    .line 20
    return-void
.end method
