.class public Lcom/google/android/gms/internal/zzhy;
.super Ljava/lang/Object;


# annotations
.annotation runtime Lcom/google/android/gms/internal/zzgk;
.end annotation

.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lcom/google/android/gms/internal/zzhy$zzc;,
        Lcom/google/android/gms/internal/zzhy$zzb;,
        Lcom/google/android/gms/internal/zzhy$zza;
    }
.end annotation


# static fields
.field private static zzIf:Lcom/google/android/gms/internal/zzl;

.field public static final zzIg:Lcom/google/android/gms/internal/zzhy$zza;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Lcom/google/android/gms/internal/zzhy$zza",
            "<",
            "Ljava/lang/Void;",
            ">;"
        }
    .end annotation
.end field

.field private static final zzpm:Ljava/lang/Object;


# direct methods
.method static constructor <clinit>()V
    .registers 1

    new-instance v0, Ljava/lang/Object;

    invoke-direct {v0}, Ljava/lang/Object;-><init>()V

    sput-object v0, Lcom/google/android/gms/internal/zzhy;->zzpm:Ljava/lang/Object;

    new-instance v0, Lcom/google/android/gms/internal/zzhy$1;

    invoke-direct {v0}, Lcom/google/android/gms/internal/zzhy$1;-><init>()V

    sput-object v0, Lcom/google/android/gms/internal/zzhy;->zzIg:Lcom/google/android/gms/internal/zzhy$zza;

    return-void
.end method

.method public constructor <init>(Landroid/content/Context;)V
    .registers 3

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    invoke-static {p1}, Lcom/google/android/gms/internal/zzhy;->zzP(Landroid/content/Context;)Lcom/google/android/gms/internal/zzl;

    move-result-object v0

    sput-object v0, Lcom/google/android/gms/internal/zzhy;->zzIf:Lcom/google/android/gms/internal/zzl;

    return-void
.end method

.method private static zzP(Landroid/content/Context;)Lcom/google/android/gms/internal/zzl;
    .registers 3

    sget-object v1, Lcom/google/android/gms/internal/zzhy;->zzpm:Ljava/lang/Object;

    monitor-enter v1

    :try_start_3
    sget-object v0, Lcom/google/android/gms/internal/zzhy;->zzIf:Lcom/google/android/gms/internal/zzl;

    if-nez v0, :cond_11

    invoke-virtual {p0}, Landroid/content/Context;->getApplicationContext()Landroid/content/Context;

    move-result-object v0

    invoke-static {v0}, Lcom/google/android/gms/internal/zzac;->zza(Landroid/content/Context;)Lcom/google/android/gms/internal/zzl;

    move-result-object v0

    sput-object v0, Lcom/google/android/gms/internal/zzhy;->zzIf:Lcom/google/android/gms/internal/zzl;

    :cond_11
    sget-object v0, Lcom/google/android/gms/internal/zzhy;->zzIf:Lcom/google/android/gms/internal/zzl;

    monitor-exit v1

    return-object v0

    :catchall_15
    move-exception v0

    monitor-exit v1
    :try_end_17
    .catchall {:try_start_3 .. :try_end_17} :catchall_15

    throw v0
.end method


# virtual methods
.method public zza(Ljava/lang/String;Lcom/google/android/gms/internal/zzhy$zza;)Lcom/google/android/gms/internal/zzih;
    .registers 6
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "<T:",
            "Ljava/lang/Object;",
            ">(",
            "Ljava/lang/String;",
            "Lcom/google/android/gms/internal/zzhy$zza",
            "<TT;>;)",
            "Lcom/google/android/gms/internal/zzih",
            "<TT;>;"
        }
    .end annotation

    new-instance v0, Lcom/google/android/gms/internal/zzhy$zzc;

    const/4 v1, 0x0

    invoke-direct {v0, p0, v1}, Lcom/google/android/gms/internal/zzhy$zzc;-><init>(Lcom/google/android/gms/internal/zzhy;Lcom/google/android/gms/internal/zzhy$1;)V

    sget-object v1, Lcom/google/android/gms/internal/zzhy;->zzIf:Lcom/google/android/gms/internal/zzl;

    new-instance v2, Lcom/google/android/gms/internal/zzhy$zzb;

    invoke-direct {v2, p1, p2, v0}, Lcom/google/android/gms/internal/zzhy$zzb;-><init>(Ljava/lang/String;Lcom/google/android/gms/internal/zzhy$zza;Lcom/google/android/gms/internal/zzm$zzb;)V

    invoke-virtual {v1, v2}, Lcom/google/android/gms/internal/zzl;->zze(Lcom/google/android/gms/internal/zzk;)Lcom/google/android/gms/internal/zzk;

    return-object v0
.end method

.method public zzb(Ljava/lang/String;Ljava/util/Map;)Lcom/google/android/gms/internal/zzih;
    .registers 9
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/lang/String;",
            "Ljava/util/Map",
            "<",
            "Ljava/lang/String;",
            "Ljava/lang/String;",
            ">;)",
            "Lcom/google/android/gms/internal/zzih",
            "<",
            "Ljava/lang/String;",
            ">;"
        }
    .end annotation

    new-instance v3, Lcom/google/android/gms/internal/zzhy$zzc;

    const/4 v0, 0x0

    invoke-direct {v3, p0, v0}, Lcom/google/android/gms/internal/zzhy$zzc;-><init>(Lcom/google/android/gms/internal/zzhy;Lcom/google/android/gms/internal/zzhy$1;)V

    new-instance v4, Lcom/google/android/gms/internal/zzhy$2;

    invoke-direct {v4, p0, p1, v3}, Lcom/google/android/gms/internal/zzhy$2;-><init>(Lcom/google/android/gms/internal/zzhy;Ljava/lang/String;Lcom/google/android/gms/internal/zzhy$zzc;)V

    new-instance v0, Lcom/google/android/gms/internal/zzhy$3;

    move-object v1, p0

    move-object v2, p1

    move-object v5, p2

    invoke-direct/range {v0 .. v5}, Lcom/google/android/gms/internal/zzhy$3;-><init>(Lcom/google/android/gms/internal/zzhy;Ljava/lang/String;Lcom/google/android/gms/internal/zzm$zzb;Lcom/google/android/gms/internal/zzm$zza;Ljava/util/Map;)V

    sget-object v1, Lcom/google/android/gms/internal/zzhy;->zzIf:Lcom/google/android/gms/internal/zzl;

    invoke-virtual {v1, v0}, Lcom/google/android/gms/internal/zzl;->zze(Lcom/google/android/gms/internal/zzk;)Lcom/google/android/gms/internal/zzk;

    return-object v3
.end method
