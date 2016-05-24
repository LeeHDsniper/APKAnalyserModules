.class public Lcom/google/android/gms/internal/zzqp$zzc;
.super Ljava/lang/Object;


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/google/android/gms/internal/zzqp;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x9
    name = "zzc"
.end annotation


# instance fields
.field private final zzWs:Ljava/lang/String;

.field private final zzaTT:Ljava/util/List;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/List",
            "<",
            "Lcom/google/android/gms/internal/zzqp$zze;",
            ">;"
        }
    .end annotation
.end field

.field private final zzaTU:Ljava/util/Map;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/Map",
            "<",
            "Ljava/lang/String;",
            "Ljava/util/List",
            "<",
            "Lcom/google/android/gms/internal/zzqp$zza;",
            ">;>;"
        }
    .end annotation
.end field

.field private final zzaTV:I


# direct methods
.method private constructor <init>(Ljava/util/List;Ljava/util/Map;Ljava/lang/String;I)V
    .registers 6
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/util/List",
            "<",
            "Lcom/google/android/gms/internal/zzqp$zze;",
            ">;",
            "Ljava/util/Map",
            "<",
            "Ljava/lang/String;",
            "Ljava/util/List",
            "<",
            "Lcom/google/android/gms/internal/zzqp$zza;",
            ">;>;",
            "Ljava/lang/String;",
            "I)V"
        }
    .end annotation

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    invoke-static {p1}, Ljava/util/Collections;->unmodifiableList(Ljava/util/List;)Ljava/util/List;

    move-result-object v0

    iput-object v0, p0, Lcom/google/android/gms/internal/zzqp$zzc;->zzaTT:Ljava/util/List;

    invoke-static {p2}, Ljava/util/Collections;->unmodifiableMap(Ljava/util/Map;)Ljava/util/Map;

    move-result-object v0

    iput-object v0, p0, Lcom/google/android/gms/internal/zzqp$zzc;->zzaTU:Ljava/util/Map;

    iput-object p3, p0, Lcom/google/android/gms/internal/zzqp$zzc;->zzWs:Ljava/lang/String;

    iput p4, p0, Lcom/google/android/gms/internal/zzqp$zzc;->zzaTV:I

    return-void
.end method

.method synthetic constructor <init>(Ljava/util/List;Ljava/util/Map;Ljava/lang/String;ILcom/google/android/gms/internal/zzqp$1;)V
    .registers 6

    invoke-direct {p0, p1, p2, p3, p4}, Lcom/google/android/gms/internal/zzqp$zzc;-><init>(Ljava/util/List;Ljava/util/Map;Ljava/lang/String;I)V

    return-void
.end method

.method public static zzBF()Lcom/google/android/gms/internal/zzqp$zzd;
    .registers 2

    new-instance v0, Lcom/google/android/gms/internal/zzqp$zzd;

    const/4 v1, 0x0

    invoke-direct {v0, v1}, Lcom/google/android/gms/internal/zzqp$zzd;-><init>(Lcom/google/android/gms/internal/zzqp$1;)V

    return-object v0
.end method


# virtual methods
.method public getVersion()Ljava/lang/String;
    .registers 2

    iget-object v0, p0, Lcom/google/android/gms/internal/zzqp$zzc;->zzWs:Ljava/lang/String;

    return-object v0
.end method

.method public toString()Ljava/lang/String;
    .registers 3

    new-instance v0, Ljava/lang/StringBuilder;

    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    const-string v1, "Rules: "

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    invoke-virtual {p0}, Lcom/google/android/gms/internal/zzqp$zzc;->zzBG()Ljava/util/List;

    move-result-object v1

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    move-result-object v0

    const-string v1, "  Macros: "

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    iget-object v1, p0, Lcom/google/android/gms/internal/zzqp$zzc;->zzaTU:Ljava/util/Map;

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    move-result-object v0

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    return-object v0
.end method

.method public zzBG()Ljava/util/List;
    .registers 2
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()",
            "Ljava/util/List",
            "<",
            "Lcom/google/android/gms/internal/zzqp$zze;",
            ">;"
        }
    .end annotation

    iget-object v0, p0, Lcom/google/android/gms/internal/zzqp$zzc;->zzaTT:Ljava/util/List;

    return-object v0
.end method

.method public zzBH()Ljava/util/Map;
    .registers 2
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()",
            "Ljava/util/Map",
            "<",
            "Ljava/lang/String;",
            "Ljava/util/List",
            "<",
            "Lcom/google/android/gms/internal/zzqp$zza;",
            ">;>;"
        }
    .end annotation

    iget-object v0, p0, Lcom/google/android/gms/internal/zzqp$zzc;->zzaTU:Ljava/util/Map;

    return-object v0
.end method
