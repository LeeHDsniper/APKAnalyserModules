.class Lcom/google/android/gms/tagmanager/zzz;
.super Ljava/lang/Object;

# interfaces
.implements Lcom/google/android/gms/tagmanager/zzar;


# static fields
.field private static final zzaOF:Ljava/lang/Object;

.field private static zzaPU:Lcom/google/android/gms/tagmanager/zzz;


# instance fields
.field private zzaPV:Ljava/lang/String;

.field private zzaPW:Ljava/lang/String;

.field private zzaPX:Lcom/google/android/gms/tagmanager/zzas;

.field private zzaPi:Lcom/google/android/gms/tagmanager/zzcd;


# direct methods
.method static constructor <clinit>()V
    .registers 1

    new-instance v0, Ljava/lang/Object;

    invoke-direct {v0}, Ljava/lang/Object;-><init>()V

    sput-object v0, Lcom/google/android/gms/tagmanager/zzz;->zzaOF:Ljava/lang/Object;

    return-void
.end method

.method private constructor <init>(Landroid/content/Context;)V
    .registers 4

    invoke-static {p1}, Lcom/google/android/gms/tagmanager/zzat;->zzaO(Landroid/content/Context;)Lcom/google/android/gms/tagmanager/zzat;

    move-result-object v0

    new-instance v1, Lcom/google/android/gms/tagmanager/zzcs;

    invoke-direct {v1}, Lcom/google/android/gms/tagmanager/zzcs;-><init>()V

    invoke-direct {p0, v0, v1}, Lcom/google/android/gms/tagmanager/zzz;-><init>(Lcom/google/android/gms/tagmanager/zzas;Lcom/google/android/gms/tagmanager/zzcd;)V

    return-void
.end method

.method constructor <init>(Lcom/google/android/gms/tagmanager/zzas;Lcom/google/android/gms/tagmanager/zzcd;)V
    .registers 3

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Lcom/google/android/gms/tagmanager/zzz;->zzaPX:Lcom/google/android/gms/tagmanager/zzas;

    iput-object p2, p0, Lcom/google/android/gms/tagmanager/zzz;->zzaPi:Lcom/google/android/gms/tagmanager/zzcd;

    return-void
.end method

.method public static zzaM(Landroid/content/Context;)Lcom/google/android/gms/tagmanager/zzar;
    .registers 3

    sget-object v1, Lcom/google/android/gms/tagmanager/zzz;->zzaOF:Ljava/lang/Object;

    monitor-enter v1

    :try_start_3
    sget-object v0, Lcom/google/android/gms/tagmanager/zzz;->zzaPU:Lcom/google/android/gms/tagmanager/zzz;

    if-nez v0, :cond_e

    new-instance v0, Lcom/google/android/gms/tagmanager/zzz;

    invoke-direct {v0, p0}, Lcom/google/android/gms/tagmanager/zzz;-><init>(Landroid/content/Context;)V

    sput-object v0, Lcom/google/android/gms/tagmanager/zzz;->zzaPU:Lcom/google/android/gms/tagmanager/zzz;

    :cond_e
    sget-object v0, Lcom/google/android/gms/tagmanager/zzz;->zzaPU:Lcom/google/android/gms/tagmanager/zzz;

    monitor-exit v1

    return-object v0

    :catchall_12
    move-exception v0

    monitor-exit v1
    :try_end_14
    .catchall {:try_start_3 .. :try_end_14} :catchall_12

    throw v0
.end method


# virtual methods
.method public zzeH(Ljava/lang/String;)Z
    .registers 5

    const/4 v0, 0x0

    iget-object v1, p0, Lcom/google/android/gms/tagmanager/zzz;->zzaPi:Lcom/google/android/gms/tagmanager/zzcd;

    invoke-interface {v1}, Lcom/google/android/gms/tagmanager/zzcd;->zzkp()Z

    move-result v1

    if-nez v1, :cond_f

    const-string v1, "Too many urls sent too quickly with the TagManagerSender, rate limiting invoked."

    invoke-static {v1}, Lcom/google/android/gms/tagmanager/zzbg;->zzaE(Ljava/lang/String;)V

    :goto_e
    return v0

    :cond_f
    iget-object v1, p0, Lcom/google/android/gms/tagmanager/zzz;->zzaPV:Ljava/lang/String;

    if-eqz v1, :cond_58

    iget-object v1, p0, Lcom/google/android/gms/tagmanager/zzz;->zzaPW:Ljava/lang/String;

    if-eqz v1, :cond_58

    :try_start_17
    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    iget-object v2, p0, Lcom/google/android/gms/tagmanager/zzz;->zzaPV:Ljava/lang/String;

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    const-string v2, "?"

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    iget-object v2, p0, Lcom/google/android/gms/tagmanager/zzz;->zzaPW:Ljava/lang/String;

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    const-string v2, "="

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    const-string v2, "UTF-8"

    invoke-static {p1, v2}, Ljava/net/URLEncoder;->encode(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v2

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object p1

    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    const-string v2, "Sending wrapped url hit: "

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-static {v1}, Lcom/google/android/gms/tagmanager/zzbg;->v(Ljava/lang/String;)V
    :try_end_58
    .catch Ljava/io/UnsupportedEncodingException; {:try_start_17 .. :try_end_58} :catch_5f

    :cond_58
    iget-object v0, p0, Lcom/google/android/gms/tagmanager/zzz;->zzaPX:Lcom/google/android/gms/tagmanager/zzas;

    invoke-interface {v0, p1}, Lcom/google/android/gms/tagmanager/zzas;->zzeL(Ljava/lang/String;)V

    const/4 v0, 0x1

    goto :goto_e

    :catch_5f
    move-exception v1

    const-string v2, "Error wrapping URL for testing."

    invoke-static {v2, v1}, Lcom/google/android/gms/tagmanager/zzbg;->zzd(Ljava/lang/String;Ljava/lang/Throwable;)V

    goto :goto_e
.end method
