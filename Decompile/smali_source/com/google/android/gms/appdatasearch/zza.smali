.class public final Lcom/google/android/gms/appdatasearch/zza;
.super Ljava/lang/Object;


# static fields
.field public static final zzOO:Lcom/google/android/gms/common/api/Api$zzc;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Lcom/google/android/gms/common/api/Api$zzc",
            "<",
            "Lcom/google/android/gms/internal/zzjf;",
            ">;"
        }
    .end annotation
.end field

.field private static final zzOP:Lcom/google/android/gms/common/api/Api$zza;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Lcom/google/android/gms/common/api/Api$zza",
            "<",
            "Lcom/google/android/gms/internal/zzjf;",
            "Lcom/google/android/gms/common/api/Api$ApiOptions$NoOptions;",
            ">;"
        }
    .end annotation
.end field

.field public static final zzOQ:Lcom/google/android/gms/common/api/Api;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Lcom/google/android/gms/common/api/Api",
            "<",
            "Lcom/google/android/gms/common/api/Api$ApiOptions$NoOptions;",
            ">;"
        }
    .end annotation
.end field

.field public static final zzOR:Lcom/google/android/gms/appdatasearch/zzk;


# direct methods
.method static constructor <clinit>()V
    .registers 4

    new-instance v0, Lcom/google/android/gms/common/api/Api$zzc;

    invoke-direct {v0}, Lcom/google/android/gms/common/api/Api$zzc;-><init>()V

    sput-object v0, Lcom/google/android/gms/appdatasearch/zza;->zzOO:Lcom/google/android/gms/common/api/Api$zzc;

    new-instance v0, Lcom/google/android/gms/appdatasearch/zza$1;

    invoke-direct {v0}, Lcom/google/android/gms/appdatasearch/zza$1;-><init>()V

    sput-object v0, Lcom/google/android/gms/appdatasearch/zza;->zzOP:Lcom/google/android/gms/common/api/Api$zza;

    new-instance v0, Lcom/google/android/gms/common/api/Api;

    const-string v1, "AppDataSearch.LIGHTWEIGHT_API"

    sget-object v2, Lcom/google/android/gms/appdatasearch/zza;->zzOP:Lcom/google/android/gms/common/api/Api$zza;

    sget-object v3, Lcom/google/android/gms/appdatasearch/zza;->zzOO:Lcom/google/android/gms/common/api/Api$zzc;

    invoke-direct {v0, v1, v2, v3}, Lcom/google/android/gms/common/api/Api;-><init>(Ljava/lang/String;Lcom/google/android/gms/common/api/Api$zza;Lcom/google/android/gms/common/api/Api$zzc;)V

    sput-object v0, Lcom/google/android/gms/appdatasearch/zza;->zzOQ:Lcom/google/android/gms/common/api/Api;

    new-instance v0, Lcom/google/android/gms/internal/zzjh;

    invoke-direct {v0}, Lcom/google/android/gms/internal/zzjh;-><init>()V

    sput-object v0, Lcom/google/android/gms/appdatasearch/zza;->zzOR:Lcom/google/android/gms/appdatasearch/zzk;

    return-void
.end method
