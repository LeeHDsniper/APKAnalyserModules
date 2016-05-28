.class Lcom/google/android/gms/tagmanager/zzdc$zza;
.super Ljava/lang/Object;

# interfaces
.implements Lcom/google/android/gms/analytics/Logger;


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/google/android/gms/tagmanager/zzdc;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x8
    name = "zza"
.end annotation


# direct methods
.method constructor <init>()V
    .registers 1

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method

.method private static zzjl(I)I
    .registers 2

    const/4 v0, 0x3

    packed-switch p0, :pswitch_data_c

    :goto_4
    :pswitch_4
    return v0

    :pswitch_5
    const/4 v0, 0x2

    goto :goto_4

    :pswitch_7
    const/4 v0, 0x1

    goto :goto_4

    :pswitch_9
    const/4 v0, 0x0

    goto :goto_4

    nop

    :pswitch_data_c
    .packed-switch 0x2
        :pswitch_9
        :pswitch_7
        :pswitch_7
        :pswitch_5
        :pswitch_4
    .end packed-switch
.end method


# virtual methods
.method public error(Ljava/lang/String;)V
    .registers 2
    .param p1, "message"    # Ljava/lang/String;

    .prologue
    invoke-static {p1}, Lcom/google/android/gms/tagmanager/zzbg;->e(Ljava/lang/String;)V

    return-void
.end method

.method public getLogLevel()I
    .registers 2

    invoke-static {}, Lcom/google/android/gms/tagmanager/zzbg;->getLogLevel()I

    move-result v0

    invoke-static {v0}, Lcom/google/android/gms/tagmanager/zzdc$zza;->zzjl(I)I

    move-result v0

    return v0
.end method

.method public setLogLevel(I)V
    .registers 3
    .param p1, "logLevel"    # I

    .prologue
    const-string v0, "GA uses GTM logger. Please use TagManager.setLogLevel(int) instead."

    invoke-static {v0}, Lcom/google/android/gms/tagmanager/zzbg;->zzaE(Ljava/lang/String;)V

    return-void
.end method

.method public warn(Ljava/lang/String;)V
    .registers 2
    .param p1, "message"    # Ljava/lang/String;

    .prologue
    invoke-static {p1}, Lcom/google/android/gms/tagmanager/zzbg;->zzaE(Ljava/lang/String;)V

    return-void
.end method
