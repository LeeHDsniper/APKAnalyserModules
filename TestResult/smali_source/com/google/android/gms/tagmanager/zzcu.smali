.class Lcom/google/android/gms/tagmanager/zzcu;
.super Lcom/google/android/gms/tagmanager/zzct;


# static fields
.field private static final zzaRX:Ljava/lang/Object;

.field private static zzaSi:Lcom/google/android/gms/tagmanager/zzcu;


# instance fields
.field private connected:Z

.field private handler:Landroid/os/Handler;

.field private zzaRY:Landroid/content/Context;

.field private zzaRZ:Lcom/google/android/gms/tagmanager/zzau;

.field private volatile zzaSa:Lcom/google/android/gms/tagmanager/zzas;

.field private zzaSb:I

.field private zzaSc:Z

.field private zzaSd:Z

.field private zzaSe:Z

.field private zzaSf:Lcom/google/android/gms/tagmanager/zzav;

.field private zzaSg:Lcom/google/android/gms/tagmanager/zzbl;

.field private zzaSh:Z


# direct methods
.method static constructor <clinit>()V
    .registers 1

    new-instance v0, Ljava/lang/Object;

    invoke-direct {v0}, Ljava/lang/Object;-><init>()V

    sput-object v0, Lcom/google/android/gms/tagmanager/zzcu;->zzaRX:Ljava/lang/Object;

    return-void
.end method

.method private constructor <init>()V
    .registers 4

    const/4 v2, 0x0

    const/4 v1, 0x1

    invoke-direct {p0}, Lcom/google/android/gms/tagmanager/zzct;-><init>()V

    const v0, 0x1b7740

    iput v0, p0, Lcom/google/android/gms/tagmanager/zzcu;->zzaSb:I

    iput-boolean v1, p0, Lcom/google/android/gms/tagmanager/zzcu;->zzaSc:Z

    iput-boolean v2, p0, Lcom/google/android/gms/tagmanager/zzcu;->zzaSd:Z

    iput-boolean v1, p0, Lcom/google/android/gms/tagmanager/zzcu;->connected:Z

    iput-boolean v1, p0, Lcom/google/android/gms/tagmanager/zzcu;->zzaSe:Z

    new-instance v0, Lcom/google/android/gms/tagmanager/zzcu$1;

    invoke-direct {v0, p0}, Lcom/google/android/gms/tagmanager/zzcu$1;-><init>(Lcom/google/android/gms/tagmanager/zzcu;)V

    iput-object v0, p0, Lcom/google/android/gms/tagmanager/zzcu;->zzaSf:Lcom/google/android/gms/tagmanager/zzav;

    iput-boolean v2, p0, Lcom/google/android/gms/tagmanager/zzcu;->zzaSh:Z

    return-void
.end method

.method public static zzAP()Lcom/google/android/gms/tagmanager/zzcu;
    .registers 1

    sget-object v0, Lcom/google/android/gms/tagmanager/zzcu;->zzaSi:Lcom/google/android/gms/tagmanager/zzcu;

    if-nez v0, :cond_b

    new-instance v0, Lcom/google/android/gms/tagmanager/zzcu;

    invoke-direct {v0}, Lcom/google/android/gms/tagmanager/zzcu;-><init>()V

    sput-object v0, Lcom/google/android/gms/tagmanager/zzcu;->zzaSi:Lcom/google/android/gms/tagmanager/zzcu;

    :cond_b
    sget-object v0, Lcom/google/android/gms/tagmanager/zzcu;->zzaSi:Lcom/google/android/gms/tagmanager/zzcu;

    return-object v0
.end method

.method private zzAQ()V
    .registers 3

    new-instance v0, Lcom/google/android/gms/tagmanager/zzbl;

    invoke-direct {v0, p0}, Lcom/google/android/gms/tagmanager/zzbl;-><init>(Lcom/google/android/gms/tagmanager/zzct;)V

    iput-object v0, p0, Lcom/google/android/gms/tagmanager/zzcu;->zzaSg:Lcom/google/android/gms/tagmanager/zzbl;

    iget-object v0, p0, Lcom/google/android/gms/tagmanager/zzcu;->zzaSg:Lcom/google/android/gms/tagmanager/zzbl;

    iget-object v1, p0, Lcom/google/android/gms/tagmanager/zzcu;->zzaRY:Landroid/content/Context;

    invoke-virtual {v0, v1}, Lcom/google/android/gms/tagmanager/zzbl;->zzaP(Landroid/content/Context;)V

    return-void
.end method

.method private zzAR()V
    .registers 5

    new-instance v0, Landroid/os/Handler;

    iget-object v1, p0, Lcom/google/android/gms/tagmanager/zzcu;->zzaRY:Landroid/content/Context;

    invoke-virtual {v1}, Landroid/content/Context;->getMainLooper()Landroid/os/Looper;

    move-result-object v1

    new-instance v2, Lcom/google/android/gms/tagmanager/zzcu$2;

    invoke-direct {v2, p0}, Lcom/google/android/gms/tagmanager/zzcu$2;-><init>(Lcom/google/android/gms/tagmanager/zzcu;)V

    invoke-direct {v0, v1, v2}, Landroid/os/Handler;-><init>(Landroid/os/Looper;Landroid/os/Handler$Callback;)V

    iput-object v0, p0, Lcom/google/android/gms/tagmanager/zzcu;->handler:Landroid/os/Handler;

    iget v0, p0, Lcom/google/android/gms/tagmanager/zzcu;->zzaSb:I

    if-lez v0, :cond_27

    iget-object v0, p0, Lcom/google/android/gms/tagmanager/zzcu;->handler:Landroid/os/Handler;

    iget-object v1, p0, Lcom/google/android/gms/tagmanager/zzcu;->handler:Landroid/os/Handler;

    const/4 v2, 0x1

    sget-object v3, Lcom/google/android/gms/tagmanager/zzcu;->zzaRX:Ljava/lang/Object;

    invoke-virtual {v1, v2, v3}, Landroid/os/Handler;->obtainMessage(ILjava/lang/Object;)Landroid/os/Message;

    move-result-object v1

    iget v2, p0, Lcom/google/android/gms/tagmanager/zzcu;->zzaSb:I

    int-to-long v2, v2

    invoke-virtual {v0, v1, v2, v3}, Landroid/os/Handler;->sendMessageDelayed(Landroid/os/Message;J)Z

    :cond_27
    return-void
.end method

.method static synthetic zzAT()Ljava/lang/Object;
    .registers 1

    sget-object v0, Lcom/google/android/gms/tagmanager/zzcu;->zzaRX:Ljava/lang/Object;

    return-object v0
.end method

.method static synthetic zza(Lcom/google/android/gms/tagmanager/zzcu;)Z
    .registers 2

    iget-boolean v0, p0, Lcom/google/android/gms/tagmanager/zzcu;->connected:Z

    return v0
.end method

.method static synthetic zzb(Lcom/google/android/gms/tagmanager/zzcu;)I
    .registers 2

    iget v0, p0, Lcom/google/android/gms/tagmanager/zzcu;->zzaSb:I

    return v0
.end method

.method static synthetic zzc(Lcom/google/android/gms/tagmanager/zzcu;)Z
    .registers 2

    iget-boolean v0, p0, Lcom/google/android/gms/tagmanager/zzcu;->zzaSh:Z

    return v0
.end method

.method static synthetic zzd(Lcom/google/android/gms/tagmanager/zzcu;)Landroid/os/Handler;
    .registers 2

    iget-object v0, p0, Lcom/google/android/gms/tagmanager/zzcu;->handler:Landroid/os/Handler;

    return-object v0
.end method

.method static synthetic zze(Lcom/google/android/gms/tagmanager/zzcu;)Lcom/google/android/gms/tagmanager/zzau;
    .registers 2

    iget-object v0, p0, Lcom/google/android/gms/tagmanager/zzcu;->zzaRZ:Lcom/google/android/gms/tagmanager/zzau;

    return-object v0
.end method


# virtual methods
.method public declared-synchronized dispatch()V
    .registers 3

    monitor-enter p0

    :try_start_1
    iget-boolean v0, p0, Lcom/google/android/gms/tagmanager/zzcu;->zzaSd:Z

    if-nez v0, :cond_f

    const-string v0, "Dispatch call queued. Dispatch will run once initialization is complete."

    invoke-static {v0}, Lcom/google/android/gms/tagmanager/zzbg;->v(Ljava/lang/String;)V

    const/4 v0, 0x1

    iput-boolean v0, p0, Lcom/google/android/gms/tagmanager/zzcu;->zzaSc:Z
    :try_end_d
    .catchall {:try_start_1 .. :try_end_d} :catchall_1a

    :goto_d
    monitor-exit p0

    return-void

    :cond_f
    :try_start_f
    iget-object v0, p0, Lcom/google/android/gms/tagmanager/zzcu;->zzaSa:Lcom/google/android/gms/tagmanager/zzas;

    new-instance v1, Lcom/google/android/gms/tagmanager/zzcu$3;

    invoke-direct {v1, p0}, Lcom/google/android/gms/tagmanager/zzcu$3;-><init>(Lcom/google/android/gms/tagmanager/zzcu;)V

    invoke-interface {v0, v1}, Lcom/google/android/gms/tagmanager/zzas;->zzg(Ljava/lang/Runnable;)V
    :try_end_19
    .catchall {:try_start_f .. :try_end_19} :catchall_1a

    goto :goto_d

    :catchall_1a
    move-exception v0

    monitor-exit p0

    throw v0
.end method

.method declared-synchronized zzAS()Lcom/google/android/gms/tagmanager/zzau;
    .registers 4

    monitor-enter p0

    :try_start_1
    iget-object v0, p0, Lcom/google/android/gms/tagmanager/zzcu;->zzaRZ:Lcom/google/android/gms/tagmanager/zzau;

    if-nez v0, :cond_1f

    iget-object v0, p0, Lcom/google/android/gms/tagmanager/zzcu;->zzaRY:Landroid/content/Context;

    if-nez v0, :cond_14

    new-instance v0, Ljava/lang/IllegalStateException;

    const-string v1, "Cant get a store unless we have a context"

    invoke-direct {v0, v1}, Ljava/lang/IllegalStateException;-><init>(Ljava/lang/String;)V

    throw v0
    :try_end_11
    .catchall {:try_start_1 .. :try_end_11} :catchall_11

    :catchall_11
    move-exception v0

    monitor-exit p0

    throw v0

    :cond_14
    :try_start_14
    new-instance v0, Lcom/google/android/gms/tagmanager/zzby;

    iget-object v1, p0, Lcom/google/android/gms/tagmanager/zzcu;->zzaSf:Lcom/google/android/gms/tagmanager/zzav;

    iget-object v2, p0, Lcom/google/android/gms/tagmanager/zzcu;->zzaRY:Landroid/content/Context;

    invoke-direct {v0, v1, v2}, Lcom/google/android/gms/tagmanager/zzby;-><init>(Lcom/google/android/gms/tagmanager/zzav;Landroid/content/Context;)V

    iput-object v0, p0, Lcom/google/android/gms/tagmanager/zzcu;->zzaRZ:Lcom/google/android/gms/tagmanager/zzau;

    :cond_1f
    iget-object v0, p0, Lcom/google/android/gms/tagmanager/zzcu;->handler:Landroid/os/Handler;

    if-nez v0, :cond_26

    invoke-direct {p0}, Lcom/google/android/gms/tagmanager/zzcu;->zzAR()V

    :cond_26
    const/4 v0, 0x1

    iput-boolean v0, p0, Lcom/google/android/gms/tagmanager/zzcu;->zzaSd:Z

    iget-boolean v0, p0, Lcom/google/android/gms/tagmanager/zzcu;->zzaSc:Z

    if-eqz v0, :cond_33

    invoke-virtual {p0}, Lcom/google/android/gms/tagmanager/zzcu;->dispatch()V

    const/4 v0, 0x0

    iput-boolean v0, p0, Lcom/google/android/gms/tagmanager/zzcu;->zzaSc:Z

    :cond_33
    iget-object v0, p0, Lcom/google/android/gms/tagmanager/zzcu;->zzaSg:Lcom/google/android/gms/tagmanager/zzbl;

    if-nez v0, :cond_3e

    iget-boolean v0, p0, Lcom/google/android/gms/tagmanager/zzcu;->zzaSe:Z

    if-eqz v0, :cond_3e

    invoke-direct {p0}, Lcom/google/android/gms/tagmanager/zzcu;->zzAQ()V

    :cond_3e
    iget-object v0, p0, Lcom/google/android/gms/tagmanager/zzcu;->zzaRZ:Lcom/google/android/gms/tagmanager/zzau;
    :try_end_40
    .catchall {:try_start_14 .. :try_end_40} :catchall_11

    monitor-exit p0

    return-object v0
.end method

.method declared-synchronized zza(Landroid/content/Context;Lcom/google/android/gms/tagmanager/zzas;)V
    .registers 4

    monitor-enter p0

    :try_start_1
    iget-object v0, p0, Lcom/google/android/gms/tagmanager/zzcu;->zzaRY:Landroid/content/Context;
    :try_end_3
    .catchall {:try_start_1 .. :try_end_3} :catchall_14

    if-eqz v0, :cond_7

    :cond_5
    :goto_5
    monitor-exit p0

    return-void

    :cond_7
    :try_start_7
    invoke-virtual {p1}, Landroid/content/Context;->getApplicationContext()Landroid/content/Context;

    move-result-object v0

    iput-object v0, p0, Lcom/google/android/gms/tagmanager/zzcu;->zzaRY:Landroid/content/Context;

    iget-object v0, p0, Lcom/google/android/gms/tagmanager/zzcu;->zzaSa:Lcom/google/android/gms/tagmanager/zzas;

    if-nez v0, :cond_5

    iput-object p2, p0, Lcom/google/android/gms/tagmanager/zzcu;->zzaSa:Lcom/google/android/gms/tagmanager/zzas;
    :try_end_13
    .catchall {:try_start_7 .. :try_end_13} :catchall_14

    goto :goto_5

    :catchall_14
    move-exception v0

    monitor-exit p0

    throw v0
.end method

.method declared-synchronized zzat(Z)V
    .registers 3

    monitor-enter p0

    :try_start_1
    iget-boolean v0, p0, Lcom/google/android/gms/tagmanager/zzcu;->zzaSh:Z

    invoke-virtual {p0, v0, p1}, Lcom/google/android/gms/tagmanager/zzcu;->zzd(ZZ)V
    :try_end_6
    .catchall {:try_start_1 .. :try_end_6} :catchall_8

    monitor-exit p0

    return-void

    :catchall_8
    move-exception v0

    monitor-exit p0

    throw v0
.end method

.method declared-synchronized zzd(ZZ)V
    .registers 7

    monitor-enter p0

    :try_start_1
    iget-boolean v0, p0, Lcom/google/android/gms/tagmanager/zzcu;->zzaSh:Z

    if-ne v0, p1, :cond_b

    iget-boolean v0, p0, Lcom/google/android/gms/tagmanager/zzcu;->connected:Z
    :try_end_7
    .catchall {:try_start_1 .. :try_end_7} :catchall_55

    if-ne v0, p2, :cond_b

    :goto_9
    monitor-exit p0

    return-void

    :cond_b
    if-nez p1, :cond_f

    if-nez p2, :cond_1b

    :cond_f
    :try_start_f
    iget v0, p0, Lcom/google/android/gms/tagmanager/zzcu;->zzaSb:I

    if-lez v0, :cond_1b

    iget-object v0, p0, Lcom/google/android/gms/tagmanager/zzcu;->handler:Landroid/os/Handler;

    const/4 v1, 0x1

    sget-object v2, Lcom/google/android/gms/tagmanager/zzcu;->zzaRX:Ljava/lang/Object;

    invoke-virtual {v0, v1, v2}, Landroid/os/Handler;->removeMessages(ILjava/lang/Object;)V

    :cond_1b
    if-nez p1, :cond_34

    if-eqz p2, :cond_34

    iget v0, p0, Lcom/google/android/gms/tagmanager/zzcu;->zzaSb:I

    if-lez v0, :cond_34

    iget-object v0, p0, Lcom/google/android/gms/tagmanager/zzcu;->handler:Landroid/os/Handler;

    iget-object v1, p0, Lcom/google/android/gms/tagmanager/zzcu;->handler:Landroid/os/Handler;

    const/4 v2, 0x1

    sget-object v3, Lcom/google/android/gms/tagmanager/zzcu;->zzaRX:Ljava/lang/Object;

    invoke-virtual {v1, v2, v3}, Landroid/os/Handler;->obtainMessage(ILjava/lang/Object;)Landroid/os/Message;

    move-result-object v1

    iget v2, p0, Lcom/google/android/gms/tagmanager/zzcu;->zzaSb:I

    int-to-long v2, v2

    invoke-virtual {v0, v1, v2, v3}, Landroid/os/Handler;->sendMessageDelayed(Landroid/os/Message;J)Z

    :cond_34
    new-instance v0, Ljava/lang/StringBuilder;

    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    const-string v1, "PowerSaveMode "

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    if-nez p1, :cond_43

    if-nez p2, :cond_58

    :cond_43
    const-string v0, "initiated."

    :goto_45
    invoke-virtual {v1, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    invoke-static {v0}, Lcom/google/android/gms/tagmanager/zzbg;->v(Ljava/lang/String;)V

    iput-boolean p1, p0, Lcom/google/android/gms/tagmanager/zzcu;->zzaSh:Z

    iput-boolean p2, p0, Lcom/google/android/gms/tagmanager/zzcu;->connected:Z
    :try_end_54
    .catchall {:try_start_f .. :try_end_54} :catchall_55

    goto :goto_9

    :catchall_55
    move-exception v0

    monitor-exit p0

    throw v0

    :cond_58
    :try_start_58
    const-string v0, "terminated."
    :try_end_5a
    .catchall {:try_start_58 .. :try_end_5a} :catchall_55

    goto :goto_45
.end method

.method declared-synchronized zzhY()V
    .registers 5

    monitor-enter p0

    :try_start_1
    iget-boolean v0, p0, Lcom/google/android/gms/tagmanager/zzcu;->zzaSh:Z

    if-nez v0, :cond_23

    iget-boolean v0, p0, Lcom/google/android/gms/tagmanager/zzcu;->connected:Z

    if-eqz v0, :cond_23

    iget v0, p0, Lcom/google/android/gms/tagmanager/zzcu;->zzaSb:I

    if-lez v0, :cond_23

    iget-object v0, p0, Lcom/google/android/gms/tagmanager/zzcu;->handler:Landroid/os/Handler;

    const/4 v1, 0x1

    sget-object v2, Lcom/google/android/gms/tagmanager/zzcu;->zzaRX:Ljava/lang/Object;

    invoke-virtual {v0, v1, v2}, Landroid/os/Handler;->removeMessages(ILjava/lang/Object;)V

    iget-object v0, p0, Lcom/google/android/gms/tagmanager/zzcu;->handler:Landroid/os/Handler;

    iget-object v1, p0, Lcom/google/android/gms/tagmanager/zzcu;->handler:Landroid/os/Handler;

    const/4 v2, 0x1

    sget-object v3, Lcom/google/android/gms/tagmanager/zzcu;->zzaRX:Ljava/lang/Object;

    invoke-virtual {v1, v2, v3}, Landroid/os/Handler;->obtainMessage(ILjava/lang/Object;)Landroid/os/Message;

    move-result-object v1

    invoke-virtual {v0, v1}, Landroid/os/Handler;->sendMessage(Landroid/os/Message;)Z
    :try_end_23
    .catchall {:try_start_1 .. :try_end_23} :catchall_25

    :cond_23
    monitor-exit p0

    return-void

    :catchall_25
    move-exception v0

    monitor-exit p0

    throw v0
.end method
